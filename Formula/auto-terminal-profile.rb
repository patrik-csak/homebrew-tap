class AutoTerminalProfile < Formula
  desc "Automatically switch Terminal profiles with macOS dark/light mode"
  homepage "https://github.com/patrik-csak/auto-terminal-profile"
  url "https://registry.npmjs.org/auto-terminal-profile/-/auto-terminal-profile-8.2.1.tgz"
  sha256 "04e617b7afd64edca4d36a5999973a75e2de4980ddf6a95002470f08005c885c"
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
