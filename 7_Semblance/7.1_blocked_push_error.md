12-14 00:33:08.400 [info] > git -c user.useConfigOnly=true commit --quiet --allow-empty-message --file - [238ms]
2024-12-14 00:33:08.410 [info] > git config --get commit.template [1ms]
2024-12-14 00:33:08.430 [info] > git config --get commit.template [8ms]
2024-12-14 00:33:08.432 [info] > git for-each-ref --format=%(refname)%00%(upstream:short)%00%(objectname)%00%(upstream:track)%00%(upstream:remotename)%00%(upstream:remoteref) refs/heads/main refs/remotes/main [2ms]
2024-12-14 00:33:08.446 [info] > git status -z -uall [8ms]
2024-12-14 00:33:08.449 [info] > git for-each-ref --sort -committerdate --format %(refname) %(objectname) %(*objectname) [3ms]
2024-12-14 00:33:08.606 [info] > git merge-base refs/heads/main refs/remotes/origin/main [142ms]
2024-12-14 00:33:08.613 [info] > git blame --root --incremental b5f080092388aabab8977de7f74420f3a3376ce1 -- /workspaces/grafana-automation/5_Formula/updated_curl_with_json_panel.md [156ms]
2024-12-14 00:33:08.616 [info] > git diff --name-status -z --diff-filter=ADMR a27f4ac16f0e94806b8a09c4dd233e0eebf668d7...refs/remotes/origin/main [3ms]
2024-12-14 00:33:08.800 [info] > git config --local branch.main.github-pr-owner-number [2ms]
2024-12-14 00:33:08.800 [warning] [Git][config] git config failed: Failed to execute git
2024-12-14 00:33:08.841 [info] > git log --format=%H%n%aN%n%aE%n%at%n%ct%n%P%n%D%n%B -z --shortstat --diff-merges=first-parent -n50 --skip=0 --topo-order --decorate=full --stdin [50ms]
2024-12-14 00:33:09.143 [info] > git push origin main:main [668ms]
2024-12-14 00:33:09.143 [info] remote: error: GH013: Repository rule violations found for refs/heads/main.        
remote: 
remote: - GITHUB PUSH PROTECTION        
remote:   —————————————————————————————————————————        
remote:     Resolve the following violations before pushing again        
remote: 
remote:     - Push cannot contain secrets        
remote: 
remote:             
remote:      (?) Learn how to resolve a blocked push        
remote:      https://docs.github.com/code-security/secret-scanning/working-with-secret-scanning-and-push-protection/working-with-push-protection-from-the-command-line#resolving-a-blocked-push        
remote:             
remote:             
remote:       —— Grafana Project Service Account Token —————————————        
remote:        locations:        
remote:          - commit: b5f080092388aabab8977de7f74420f3a3376ce1        
remote:            path: 1_Journey/1.3_commands_withupdatedPrompt.md:98        
remote:          - commit: b5f080092388aabab8977de7f74420f3a3376ce1        
remote:            path: 1_Journey/1.3_commands_withupdatedPrompt.md:102        
remote:          - commit: b5f080092388aabab8977de7f74420f3a3376ce1        
remote:            path: 1_Journey/1.3_commands_withupdatedPrompt.md:113        
remote:          - commit: b5f080092388aabab8977de7f74420f3a3376ce1        
remote:            path: 4_UI/dashboard_curl.md:1        
remote:          - commit: b5f080092388aabab8977de7f74420f3a3376ce1        
remote:            path: 5_Formula/updated_curl_with_json_panel.md:4        
remote:             
remote:        (?) To push, remove secret from commit(s) or follow this URL to allow the secret.        
remote:        https://github.com/rifaterdemsahin/grafana-automation/security/secret-scanning/unblock-secret/2qBWL9gvoaYAmqrxlzWOxNqUgn0        
remote:             
remote: 
remote: 
To https://github.com/rifaterdemsahin/grafana-automation
 ! [remote rejected] main -> main (push declined due to repository rule violations)
error: failed to push some refs to 'https://github.com/rifaterdemsahin/grafana-automation'
2024-12-14 00:33:09.156 [info] > git config --get commit.template [2ms]
2024-12-14 00:33:09.164 [info] > git for-each-ref --format=%(refname)%00%(upstream:short)%00%(objectname)%00%(upstream:track)%00%(upstream:remotename)%00%(upstream:remoteref) refs/heads/main refs/remotes/main [2ms]
2024-12-14 00:33:09.178 [info] > git status -z -uall [8ms]
2024-12-14 00:33:09.179 [info] > git for-each-ref --sort -committerdate --format %(refname) %(objectname) %(*objectname) [2ms]
2024-12-14 00:33:09.354 [info] > git config --get commit.template [2ms]
2024-12-14 00:33:09.362 [info] > git for-each-ref --format=%(refname)%00%(upstream:short)%00%(objectname)%00%(upstream:track)%00%(upstream:remotename)%00%(upstream:remoteref) refs/heads/main refs/remotes/main [2ms]
2024-12-14 00:33:09.377 [info] > git status -z -uall [8ms]
2024-12-14 00:33:09.378 [info] > git for-each-ref --sort -committerdate --format %(refname) %(objectname) %(*objectname) [2ms]
2024-12-14 00:33:09.635 [info] > git ls-files --stage -- /workspaces/grafana-automation/4_UI/panel.json [8ms]
2024-12-14 00:33:09.643 [info] > git ls-files --stage -- /workspaces/grafana-automation/5_Formula/updated_curl_with_json_panel.md [9ms]
2024-12-14 00:33:09.650 [info] > git cat-file -s c37ee193340cbdfd5f367cfc58cadd833a5a068c [8ms]
2024-12-14 00:33:09.651 [info] > git cat-file -s f221421f8c4a215de9beddf432c1e3bcd21be878 [1ms]
2024-12-14 00:33:09.821 [info] > git show --textconv :4_UI/panel.json [8ms]
2024-12-14 00:33:09.823 [info] > git show --textconv :5_Formula/updated_curl_with_json_panel.md [2ms]
2024-12-14 00:33:16.055 [info] > git log --oneline --cherry main...main@{upstream} -- [2ms]
2024-12-14 00:33:16.370 [info] > git pull --tags origin main [308ms]
2024-12-14 00:33:16.370 [info] From https://github.com/rifaterdemsahin/grafana-automation
 * branch            main       -> FETCH_HEAD
2024-12-14 00:33:17.086 [info] > git push origin main:main [708ms]
2024-12-14 00:33:17.086 [info] remote: error: GH013: Repository rule violations found for refs/heads/main.        
remote: 
remote: - GITHUB PUSH PROTECTION        
remote:   —————————————————————————————————————————        
remote:     Resolve the following violations before pushing again        
remote: 
remote:     - Push cannot contain secrets        
remote: 
remote:             
remote:      (?) Learn how to resolve a blocked push        
remote:      https://docs.github.com/code-security/secret-scanning/working-with-secret-scanning-and-push-protection/working-with-push-protection-from-the-command-line#resolving-a-blocked-push        
remote:             
remote:             
remote:       —— Grafana Project Service Account Token —————————————        
remote:        locations:        
remote:          - commit: b5f080092388aabab8977de7f74420f3a3376ce1        
remote:            path: 1_Journey/1.3_commands_withupdatedPrompt.md:98        
remote:          - commit: b5f080092388aabab8977de7f74420f3a3376ce1        
remote:            path: 1_Journey/1.3_commands_withupdatedPrompt.md:102        
remote:          - commit: b5f080092388aabab8977de7f74420f3a3376ce1        
remote:            path: 1_Journey/1.3_commands_withupdatedPrompt.md:113        
remote:          - commit: b5f080092388aabab8977de7f74420f3a3376ce1        
remote:            path: 4_UI/dashboard_curl.md:1        
remote:          - commit: b5f080092388aabab8977de7f74420f3a3376ce1        
remote:            path: 5_Formula/updated_curl_with_json_panel.md:4        
remote:             
remote:        (?) To push, remove secret from commit(s) or follow this URL to allow the secret.        
remote:        https://github.com/rifaterdemsahin/grafana-automation/security/secret-scanning/unblock-secret/2qBWL9gvoaYAmqrxlzWOxNqUgn0        
remote:             
remote: 
remote: 
To https://github.com/rifaterdemsahin/grafana-automation
 ! [remote rejected] main -> main (push declined due to repository rule violations)
error: failed to push some refs to 'https://github.com/rifaterdemsahin/grafana-automation'
2024-12-14 00:33:17.109 [info] > git config --get commit.template [10ms]
2024-12-14 00:33:17.110 [info] > git for-each-ref --format=%(refname)%00%(upstream:short)%00%(objectname)%00%(upstream:track)%00%(upstream:remotename)%00%(upstream:remoteref) refs/heads/main refs/remotes/main [2ms]
2024-12-14 00:33:17.126 [info] > git status -z -uall [9ms]
2024-12-14 00:33:17.127 [info] > git for-each-ref --sort -committerdate --format %(refname) %(objectname) %(*objectname) [3ms]
2024-12-14 00:33:17.990 [info] > git ls-files --stage -- /workspaces/grafana-automation/4_UI/panel.json [10ms]
2024-12-14 00:33:17.998 [info] > git ls-files --stage -- /workspaces/grafana-automation/5_Formula/updated_curl_with_json_panel.md [9ms]
2024-12-14 00:33:18.005 [info] > git cat-file -s c37ee193340cbdfd5f367cfc58cadd833a5a068c [8ms]
2024-12-14 00:33:18.006 [info] > git cat-file -s f221421f8c4a215de9beddf432c1e3bcd21be878 [2ms]
2024-12-14 00:33:18.192 [info] > git show --textconv :4_UI/panel.json [10ms]
2024-12-14 00:33:18.192 [info] > git show --textconv :5_Formula/updated_curl_with_json_panel.md [3ms]
2024-12-14 00:33:27.496 [info] > git fetch [243ms]
2024-12-14 00:33:27.510 [info] > git config --get commit.template [7ms]
2024-12-14 00:33:27.512 [info] > git for-each-ref --format=%(refname)%00%(upstream:short)%00%(objectname)%00%(upstream:track)%00%(upstream:remotename)%00%(upstream:remoteref) refs/heads/main refs/remotes/main [2ms]
2024-12-14 00:33:27.526 [info] > git status -z -uall [7ms]
2024-12-14 00:33:27.527 [info] > git for-each-ref --sort -committerdate --format %(refname) %(objectname) %(*objectname) [2ms]
2024-12-14 00:33:28.776 [info] > git config --get commit.template [7ms]
2024-12-14 00:33:28.778 [info] > git for-each-ref --format=%(refname)%00%(upstream:short)%00%(objectname)%00%(upstream:track)%00%(upstream:remotename)%00%(upstream:remoteref) refs/heads/main refs/remotes/main [2ms]
2024-12-14 00:33:28.795 [info] > git status -z -uall [10ms]
2024-12-14 00:33:28.795 [info] > git for-each-ref --sort -committerdate --format %(refname) %(objectname) %(*objectname) [3ms]
2024-12-14 00:33:29.021 [info] > git ls-files --stage -- /workspaces/grafana-automation/4_UI/panel.json [8ms]
2024-12-14 00:33:29.030 [info] > git cat-file -s c37ee193340cbdfd5f367cfc58cadd833a5a068c [1ms]
2024-12-14 00:33:29.030 [info] > git ls-files --stage -- /workspaces/grafana-automation/5_Formula/updated_curl_with_json_panel.md [11ms]
2024-12-14 00:33:29.039 [info] > git cat-file -s f221421f8c4a215de9beddf432c1e3bcd21be878 [2ms]
2024-12-14 00:33:29.269 [info] > git show --textconv :4_UI/panel.json [8ms]
2024-12-14 00:33:29.272 [info] > git show --textconv :5_Formula/updated_curl_with_json_panel.md [3ms]
