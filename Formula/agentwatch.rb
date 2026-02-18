class Agentwatch < Formula
  desc "Terminal UI for watching AI agents work"
  homepage "https://github.com/twiced-technology-gmbh/agentwatch"
  url "https://github.com/twiced-technology-gmbh/agentwatch/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "144a76b26dc548f4892e4084f73491a6ba829d4b34099c70abcd7ede644a946c"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/twiced-technology-gmbh/agentwatch/cmd.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/agentwatch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentwatch --version")
  end
end
