cask "clipboard-manager" do
  version "1.0.0"
  sha256 "9b57b37703818f09f8f0f31b05b1cf37db59d7e67a671015cd792211dcb70ae9"

  url "https://github.com/armaansg/ClipboardManager/releases/download/v#{version}/ClipboardManager-#{version}.dmg"
  name "Clipboard Manager"
  desc "Local-only clipboard history manager with a bottom-anchored glass panel"
  homepage "https://github.com/armaansg/ClipboardManager"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ClipboardManager.app"

  uninstall quit:       "dev.armaan.ClipboardManager",
            login_item: "ClipboardManager"

  zap trash: [
    "~/Library/Application Support/ClipboardManager",
    "~/Library/Preferences/dev.armaan.ClipboardManager.plist",
  ]

  caveats <<~EOS
    Until releases are signed with an Apple Developer ID, macOS will block the first launch with an
    "Apple could not verify" message. Approve it once in System Settings → Privacy & Security → Open
    Anyway, or clear the quarantine flag yourself:
      xattr -dr com.apple.quarantine #{appdir}/ClipboardManager.app
  EOS
end
