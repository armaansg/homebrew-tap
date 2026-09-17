# armaansg/homebrew-tap

Homebrew casks for my macOS apps.

```sh
brew tap armaansg/tap
brew install --cask clipboard-manager
```

Homebrew no longer offers a flag to skip Gatekeeper's check on unsigned casks. Until releases are
signed with a Developer ID, approve the app once after install: System Settings → Privacy & Security
→ Open Anyway, or `xattr -dr com.apple.quarantine /Applications/ClipboardManager.app`.

| Cask | App |
| --- | --- |
| `clipboard-manager` | [Clipboard Manager](https://github.com/armaansg/ClipboardManager), a local-only clipboard history manager |

The cask is updated automatically by the app's release workflow.
