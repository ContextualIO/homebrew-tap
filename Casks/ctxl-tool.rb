cask "ctxl-tool" do
  version "0.2.1"
  sha256 "da8b27d49d536cef4b630e1103f3e5104a0e8e2f5517d9f6ca1f8a865e55febb"

  url "https://github.com/ContextualIO/ctxl-tool-artifacts/releases/download/v#{version}/ctxl-tool_#{version}_universal.dmg"
  name "Ctxl Tool"
  desc "Companion app for the ctxl CLI"
  homepage "https://build-artifacts.contextual.io/"

  # The app self-updates via tauri-plugin-updater; livecheck reads the same
  # manifest the updater consumes, so `brew livecheck` tracks true latest.
  livecheck do
    url "https://build-artifacts.contextual.io/ctxl-tool/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on :macos

  app "Ctxl Tool.app"

  zap trash: [
    "~/Library/Application Support/io.contextual.ctxl-tool",
    "~/Library/Caches/io.contextual.ctxl-tool",
    "~/Library/HTTPStorages/io.contextual.ctxl-tool",
    "~/Library/Preferences/io.contextual.ctxl-tool.plist",
    "~/Library/Saved Application State/io.contextual.ctxl-tool.savedState",
    "~/Library/WebKit/io.contextual.ctxl-tool",
  ]
end
