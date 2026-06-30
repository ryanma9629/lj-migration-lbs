import { chromium } from "playwright";

const baseUrl = process.env.BASE_URL || "http://127.0.0.1:18080/LBIBS";
const loginPath = process.env.LOGIN_PATH || "/jsp/login/login.html";
const loginPostPath = process.env.LOGIN_POST_PATH || "/jsp/login/login.jsp";
const userId = process.env.LOGIN_USER || "admin";
const password = process.env.LOGIN_PASSWORD || "12345";
const pageId = process.env.PAGEID || "home";
const pageUrl = process.env.PAGE_URL || `${baseUrl}/ShowReport.wx?PAGEID=${encodeURIComponent(pageId)}`;
const waitMs = Number(process.env.WAIT_MS || "1500");

function printSection(title, value) {
  process.stdout.write(`\n[${title}]\n${value}\n`);
}

const browser = await chromium.launch({
  channel: "chrome",
  headless: true
});

const page = await browser.newPage();

try {
  await page.goto(`${baseUrl}${loginPath}`, { waitUntil: "domcontentloaded" });
  await page.fill('input[name="TxtUserID"]', userId);
  await page.fill('input[name="TxtPassword"]', password);

  const submit = page.locator('input[type="submit"], button[type="submit"], input[value="登录"]');
  await Promise.all([
    page.waitForNavigation({ waitUntil: "domcontentloaded" }).catch(() => null),
    submit.first().click()
  ]);

  await page.goto(pageUrl, { waitUntil: "networkidle" });
  await page.waitForTimeout(waitMs);

  const title = await page.title();
  const bodyText = await page.locator("body").innerText();

  printSection("Base URL", baseUrl);
  printSection("Target Page", pageUrl);
  printSection("Document Title", title || "(empty)");
  printSection("Body Preview", bodyText.slice(0, 1000));
  printSection("Result", "OK");
} catch (error) {
  printSection("Result", "FAILED");
  printSection("Error", error && error.stack ? error.stack : String(error));
  process.exitCode = 1;
} finally {
  await browser.close();
}
