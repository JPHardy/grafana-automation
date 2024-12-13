http://localhost:3001/users does not work. Can you explain why?

Yes, that makes perfect sense! When you're working in GitHub Codespaces, "localhost" refers to the Codespace environment, not your local machine. To access the service from your Codespace, you need to:

1. Make the port public in your Codespace:
   - Either click the ports tab in VS Code and make port 3001 public
   - Or use the command palette (Cmd/Ctrl + Shift + P) and search for "Ports: Make Public"

2. Use the Codespace URL:
   - When you forward the port, GitHub Codespaces will generate a URL like:
   `https://<your-codespace-name>-3001.preview.app.github.dev/users`

So your requests would be:
```bash
# Instead of
curl http://localhost:3001/users

# Use
curl https://<your-codespace-name>-3001.preview.app.github.dev/users
```

This happens because:
- Your Codespace is running in a container in the cloud
- The "localhost" in Codespace refers to that container
- You need the public URL to access it from your browser

Would you like me to help you set up the proper port forwarding for Codespaces?

prompt:
- objective: Rationale port forwarding
- Format: Create a summary
- Format: Use emojis
- Format: one-line comment
- Format: use markdown structure
- Rewrite: Eliminate duplicate information