class AutoTerminalProfile < Formula
  desc "Automatically switch Terminal profiles with macOS dark/light mode"
  homepage "https://github.com/patrik-csak/auto-terminal-profile"
  url "https://github.com/patrik-csak/auto-terminal-profile/archive/refs/tags/v7.0.0.tar.gz"
  sha256 "7f056da783f0924c5d7b33ec4a1469a76ae735772d7e06be667a3e9572ea3811"
  license "MIT"

  depends_on "cormacrelf/tap/dark-notify"
  depends_on :macos
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  service do
    run [
      Formula["cormacrelf/tap/dark-notify"].opt_bin/"dark-notify",
      "-c",
      "#{opt_bin}/auto-terminal-profile update $1",
    ]
    keep_alive successful_exit: true
  end
end
