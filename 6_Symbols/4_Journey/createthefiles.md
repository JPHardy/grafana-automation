The `tree` command in Unix-like operating systems doesn't natively support displaying file creation times. However, you can achieve this by combining `tree` with other commands like `stat` or `ls` to display creation times.

Here's a way to do it using `ls`:

```sh
ls -lt --time=creation | tree
```

This command lists files with their creation times and then pipes the output to `tree` for a hierarchical view. Note that the `--time=creation` option is available on some systems, but not all. If your system doesn't support it, you might need to use `stat` instead.

For example, using `stat`:

```sh
find . -type f -exec stat --format '%W %n' {} \; | sort -n | while read -r time file; do echo "$(date -d @$time) $file"; done
```

This command finds all files, gets their creation times using `stat`, sorts them, and then prints the creation time and file name.

Let me know if you need further assistance or have any other questions!