#!/usr/bin/env bash
# 用途：替 repo 建立工作追蹤用的 5 個 label
# 用法：tracking/init-repo.sh OWNER/REPO
# --force 讓重跑也安全（已存在就更新顏色與說明）
set -euo pipefail
repo="${1:?用法：tracking/init-repo.sh OWNER/REPO}"
gh label create "需求"       --repo "$repo" --color 1D76DB --description "新功能或行為改變" --force
gh label create "bug"        --repo "$repo" --color D73A4A --description "行為與預期不符" --force
gh label create "維運"       --repo "$repo" --color 5319E7 --description "部署、設定、文件、工具" --force
gh label create "需實際驗收" --repo "$repo" --color FBCA04 --description "要在實際使用環境確認才算完成" --force
gh label create "高風險"     --repo "$repo" --color B60205 --description "影響資料、硬體、安全或對外行為" --force
