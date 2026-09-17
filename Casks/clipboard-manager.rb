cask "clipboard-manager" do
  version "1.0.0"
  sha256 "REPLACED_AUTOMATICALLY_BY_RELEASE_WORKFLOW"

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
    Until releases are signed with an Apple Developer ID, macOS will block the first launch.
    Either install with `brew install --cask --no-quarantine clipboard-manager`, or approve the app
    once in System Settings → Privacy & Security → Open Anyway.
  EOS
end
