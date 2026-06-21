class AutoTerminalProfile < Formula
  desc "Automatically switch Terminal profiles with macOS dark/light mode"
  homepage "https://github.com/patrik-csak/auto-terminal-profile"
  url "https://registry.npmjs.org/auto-terminal-profile/-/auto-terminal-profile-8.1.0.tgz"
  sha256 "f2b59e117190544e4e76e9ed7d61ee0554b624ca8f51893b1a767bceccd89ab0"
  license "MIT"

  depends_on :macos
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  # TODO: Add test
  # https://docs.brew.sh/Formula-Cookbook#add-a-test-to-the-formula

  service do
    run [opt_bin/"auto-terminal-profile", "watch"]
    keep_alive successful_exit: true
  end
end
