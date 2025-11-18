class AutoTerminalProfile < Formula
  desc "Automatically switch Terminal profiles with macOS dark/light mode"
  homepage "https://github.com/patrik-csak/auto-terminal-profile"
  url "https://github.com/patrik-csak/auto-terminal-profile/archive/refs/tags/v7.0.1.tar.gz"
  sha256 "f606d6bed66631066763bf51981151a4f5dbd752df74cdbcbf1f9fb31be44813"
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
