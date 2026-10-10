class AutoTerminalProfile < Formula
  desc "Automatically switch Terminal profiles with macOS dark/light mode"
  homepage "https://github.com/patrik-csak/auto-terminal-profile"
  url "https://registry.npmjs.org/auto-terminal-profile/-/auto-terminal-profile-8.2.2.tgz"
  sha256 "ac61ec36152344402dc94d2792f694ca6bc808c324d65d02787845f483bb541c"
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
