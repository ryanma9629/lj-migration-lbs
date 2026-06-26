#!/bin/sh
set -eu

base_url="${1:-http://127.0.0.1:18080/LBIBS}"

curl -fsS "${base_url}/jsp/login/login.html" >/dev/null
curl -fsS "${base_url}/ShowReport.wx?PAGEID=home" >/dev/null
curl -fsS "${base_url}/ShowReport.wx?PAGEID=system_menu" >/dev/null
curl -fsS "${base_url}/ShowReport.wx?PAGEID=system_parameter" >/dev/null

echo "smoke check passed for ${base_url}"
