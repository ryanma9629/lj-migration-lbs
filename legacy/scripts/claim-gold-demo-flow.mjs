import { chromium } from "playwright";

const baseUrl = process.env.BASE_URL || "http://127.0.0.1:18080/LBIBS";
const claimerUser = process.env.CLAIMER_USER || "claimer_gold";
const claimerPassword = process.env.CLAIMER_PASSWORD || "12345";
const verifierUser = process.env.VERIFIER_USER || "verifier_gold";
const verifierPassword = process.env.VERIFIER_PASSWORD || "12345";
const submitVoucher = process.env.SUBMIT_VOUCHER || "GOLDVUCH1001";
const submitTxn = process.env.SUBMIT_TXN || "GOLDDEMO1001";
const approveVoucher = process.env.APPROVE_VOUCHER || submitVoucher;
const approveTxn = process.env.APPROVE_TXN || submitTxn;
const submitRatio = process.env.SUBMIT_RATIO || "40";
const submitRemark = process.env.SUBMIT_REMARK || "claim_gold demo submit";
const headless = process.env.HEADLESS !== "false";

function logSection(title, value) {
  process.stdout.write(`\n[${title}]\n${value}\n`);
}

async function login(page, userId, password) {
  await page.goto(`${baseUrl}/jsp/login/login.html`, { waitUntil: "domcontentloaded" });
  await page.fill('input[name="TxtUserID"]', userId);
  await page.fill('input[name="TxtPassword"]', password);
  await Promise.all([
    page.waitForNavigation({ waitUntil: "domcontentloaded" }).catch(() => null),
    page.locator('input[type="submit"], button[type="submit"], input[value="登录"]').first().click()
  ]);
}

async function settle(page, timeout = 1500) {
  await page.waitForLoadState("networkidle").catch(() => null);
  await page.waitForTimeout(timeout);
}

async function acceptVisibleConfirmation(page) {
  const confirmButton = page.locator(
    'input[type="button"][value="确定"]:visible, button:has-text("确定"):visible, input[type="submit"][value="确定"]:visible'
  ).first();
  await confirmButton.waitFor({ state: "visible", timeout: 10000 });
  await confirmButton.click();
}

async function runClaimerFlow(browser) {
  const page = await browser.newPage();
  page.on("dialog", dialog => dialog.accept().catch(() => null));
  await login(page, claimerUser, claimerPassword);
  await page.goto(`${baseUrl}/ShowReport.wx?PAGEID=claim_gold&VUCH_NBR=${encodeURIComponent(submitVoucher)}`, {
    waitUntil: "domcontentloaded"
  });
  await settle(page);

  const ratioInput = page.locator("#claim_gold_guid_dtl_wxcol_RATIO");
  await ratioInput.waitFor({ state: "visible", timeout: 10000 });
  await ratioInput.fill(submitRatio);

  const remarkBox = page.locator("textarea").first();
  if (await remarkBox.count()) {
    await remarkBox.fill(submitRemark);
  }

  await page.locator('input[type="button"][value="保 存"]').click();
  await settle(page, 2000);

  const savedRatio = await ratioInput.inputValue().catch(() => "(unavailable)");
  logSection("Claimer Save", `ratio=${savedRatio}`);

  await page.locator('input[type="button"][value="提交"]').click();
  await acceptVisibleConfirmation(page);
  await settle(page, 2500);

  const bodyText = await page.locator("body").innerText();
  logSection("Claimer Body Preview", bodyText.slice(0, 800));

  await page.close();
}

async function runVerifierFlow(browser) {
  const page = await browser.newPage();
  page.on("dialog", dialog => dialog.accept().catch(() => null));
  await login(page, verifierUser, verifierPassword);
  await page.goto(`${baseUrl}/ShowReport.wx?PAGEID=claim_gold_verify&VUCH_NBR=${encodeURIComponent(approveVoucher)}`, {
    waitUntil: "domcontentloaded"
  });
  await settle(page);

  const row = page.locator("tr", { hasText: approveTxn }).first();
  await row.waitFor({ state: "visible", timeout: 10000 });

  const approveButton = row.locator('input[type="button"][value="通过"]').first();
  await approveButton.click();
  await settle(page, 2500);

  const bodyText = await page.locator("body").innerText();
  logSection("Verifier Body Preview", bodyText.slice(0, 800));

  await page.close();
}

const browser = await chromium.launch({
  channel: "chrome",
  headless
});

try {
  logSection("Base URL", baseUrl);
  logSection("Submit Flow", `${claimerUser} -> ${submitTxn} (${submitVoucher}) ratio=${submitRatio}`);
  logSection("Approve Flow", `${verifierUser} -> ${approveTxn} (${approveVoucher})`);

  await runClaimerFlow(browser);
  await runVerifierFlow(browser);

  logSection("Result", "OK");
} catch (error) {
  logSection("Result", "FAILED");
  logSection("Error", error && error.stack ? error.stack : String(error));
  process.exitCode = 1;
} finally {
  await browser.close();
}
