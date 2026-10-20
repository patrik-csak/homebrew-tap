class AutoTerminalProfile < Formula
  desc "Automatically switch Terminal profiles with macOS dark/light mode"
  homepage "https://github.com/patrik-csak/auto-terminal-profile"
  url "https://registry.npmjs.org/auto-terminal-profile/-/auto-terminal-profile-8.3.1.tgz"
  sha256 "86dd2dfe63fc8bd6a05272c2f4e99a56f00e75eb8fec1911bedcbcdb648149e1"
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
    name = "auto-terminal-profile"

    run [opt_bin/name, "watch"]
    keep_alive true
    error_log_path var/"log/#{name}.log"
  end
end
