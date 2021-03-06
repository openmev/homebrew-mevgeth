class MEV-Ethereum < Formula
  desc "Go implementation of MEV-Auction for Ethereum"
  homepage "https://github.com/flashbots/mev-geth"
  url "https://github.com/flashbots/mev-geth.git", :tag => "v1.10.8-mev0.3.0"
  head do
     url "https://github.com/flashbots/mev-geth.git", :branch => "master"
  end

  # Require El Capitan at least
  depends_on :macos => :el_capitan

  # Is there a better way to ensure that frameworks (IOKit, CoreServices, etc) are installed?
  depends_on :xcode => :build

  depends_on "go" => :build

  def install
    ENV["GOROOT"] = "#{HOMEBREW_PREFIX}/opt/go/libexec"
    system "go", "env" # Debug env
    system "make", "all"
    bin.install "build/bin/evm"
    bin.install "build/bin/geth"
    bin.install "build/bin/rlpdump"
    bin.install "build/bin/puppeth"
  end

  test do
    system "#{HOMEBREW_PREFIX}/bin/geth", "--version"
  end
end
