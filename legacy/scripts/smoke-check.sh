#!/bin/sh
set -eu

base_url="${1:-http://127.0.0.1:18080/LBIBS}"
cookie_jar="$(mktemp)"
response_body="$(mktemp)"

cleanup() {
  rm -f "${cookie_jar}" "${response_body}"
}

trap cleanup EXIT INT TERM

curl -fsS -c "${cookie_jar}" "${base_url}/jsp/login/login.html" >/dev/null
curl -fsS -L -c "${cookie_jar}" -b "${cookie_jar}" \
  -d "TxtUserID=admin" \
  -d "TxtPassword=12345" \
  "${base_url}/jsp/login/login.jsp" >/dev/null

check_page() {
  page_id="$1"
  marker="$2"

  curl -fsS -b "${cookie_jar}" \
    "${base_url}/ShowReport.wx?PAGEID=${page_id}" >"${response_body}"

  if grep -Eq 'login\.html|TxtUserID|TxtPassword|action="login\.jsp"' "${response_body}"; then
    echo "smoke check failed: ${page_id} returned login content" >&2
    exit 1
  fi

  if ! grep -Fq "${marker}" "${response_body}"; then
    echo "smoke check failed: ${page_id} missing expected marker: ${marker}" >&2
    exit 1
  fi
}

check_page "home" "所有功能"
check_page "system_menu" "菜单名称"
check_page "system_parameter" "通用参数设置"
check_page "system_consts" "Consts设定"

echo "smoke check passed for ${base_url} with authenticated pages"
