# Rickliou/.github

所有 Rickliou repo 共用的 issue 範本、PR 範本與工作追蹤工具。

- repo 自己沒有 `.github/ISSUE_TEMPLATE/` 時，會自動套用這裡的 issue 範本；PR 範本同理。
- 某個 repo 只要自己放了任何 issue 範本，這裡整個 `ISSUE_TEMPLATE/` 就不再套用（GitHub 的規則）。
  專案特有的選項請放在該專案的 Project 欄位，不要另寫範本。
- 這個 repo 必須是公開的，GitHub 才會套用；裡面不放任何專案資訊或密鑰。
- 修改範本走分支與 PR；改了 `tracking/AGENTS-tracking.md` 後，要手動同步到各 repo 的 `AGENTS.md`。

## 內容

| 檔案 | 用途 |
| --- | --- |
| `.github/ISSUE_TEMPLATE/feature.yml` | 需求：目的、範圍與排除、驗收條件、依賴、風險 |
| `.github/ISSUE_TEMPLATE/bug.yml` | 問題回報：環境、現象、預期行為、修好的判定 |
| `.github/pull_request_template.md` | PR：對應 issue（Closes／Refs）、逐條驗收證據、高風險條件、未驗證事項、部署與回滾 |
| `tracking/init-repo.sh` | 替 repo 建立 5 個工作追蹤 label |
| `tracking/AGENTS-tracking.md` | 給 AI 的工作追蹤規則原稿與專案設定範本 |

## 新專案套用步驟

1. 在 Rickliou 下開 repo
2. `gh project copy <專案範本編號> --source-owner Rickliou --target-owner Rickliou --title <專案名>`，
   再 `gh project link <新編號> --owner Rickliou --repo Rickliou/<repo>`
3. 在新看板網頁：Workflows → Auto-add to project → 選這個 repo、篩選 `is:issue` → 開啟（要在開第一個 issue 前）
4. `tracking/init-repo.sh Rickliou/<repo>` 建 label
5. 在 repo 的 `AGENTS.md` 貼上 `tracking/AGENTS-tracking.md`，填好「專案設定」（含正式整合分支與部署來源），開 PR
6. 開第一批 issue
