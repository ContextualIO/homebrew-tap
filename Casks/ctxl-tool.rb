cask "ctxl-tool" do
  version "0.3.0"
  sha256 "eede2d8a7a5588e17f91d0d9ae7b5509c38e452b1eec94d5f52ba800ce6b3cf1"

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
