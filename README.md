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
| `.github/ISSUE_TEMPLATE/quick.yml` | 速記：只有「內容」必填，給手機或臨時記錄用；自動加「待整理」，補齊開工欄位前不開工 |
| `.github/pull_request_template.md` | PR：對應 issue（Closes／Refs）、逐條驗收證據、高風險條件、未驗證事項、部署與回滾 |
| `tracking/init-repo.sh` | 替 repo 建立 6 個工作追蹤 label |
| `tracking/AGENTS-tracking.md` | 給 AI 的工作追蹤規則原稿與專案設定範本 |

## 手機開速記

GitHub app 與手機版網頁（Safari）都不顯示 issue 表單，按「新增 issue」直接進空白編輯畫面；`?template=quick.yml` 在手機上也無效。改用網址參數：

- **建議**：手機瀏覽器打開 `https://github.com/Rickliou/<repo>/issues/new?title=%5B%E9%80%9F%E8%A8%98%5D%20&labels=%E5%BE%85%E6%95%B4%E7%90%86`（標題預填「[速記] 」、預選「待整理」label），用「加入主畫面」存成捷徑。label 參數只對有寫入權限的人生效。
- 用 app 開空白 issue 時，標題以「速記」開頭；整理時會用 `速記 in:title -label:待整理` 搜到並補上 label。
- 電腦上照常選「速記」表單。

## 新專案套用步驟

1. 在 Rickliou 下開 repo
2. `gh project copy <專案範本編號> --source-owner Rickliou --target-owner Rickliou --title <專案名>`，
   再 `gh project link <新編號> --owner Rickliou --repo Rickliou/<repo>`
3. 在新看板網頁：Workflows → Auto-add to project → 選這個 repo、篩選 `is:issue` → 開啟（要在開第一個 issue 前）
4. `tracking/init-repo.sh Rickliou/<repo>` 建 label
5. 在 repo 的 `AGENTS.md` 貼上 `tracking/AGENTS-tracking.md`，填好「專案設定」（含正式整合分支與部署來源），開 PR
6. 開第一批 issue
