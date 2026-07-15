cask "ctxl-tool" do
  version "0.2.2"
  sha256 "4a86e4780d0a3a7c6d8710d2f2ba36ece267a69d64ba2a75c15d124c5a5b7a5a"

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
