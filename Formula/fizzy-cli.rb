class FizzyCli < Formula
  desc "CLI for https://fizzy.do"
  homepage "https://github.com/rogeriopvl/fizzy-cli"
  url "https://github.com/rogeriopvl/fizzy-cli/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "1fe65fd82bc904736e7034eb14308ba26f6c491c17de0ba052b4dc5d162db211"
  license "MIT"
  head "https://github.com/rogeriopvl/fizzy-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/rogeriopvl/fizzy/cmd.Version=#{version}
    ]
    system "go", "build", *std_go_args(output: bin/"fizzy", ldflags:)
  end

  test do
    assert_match "Fizzy CLI", shell_output("#{bin}/fizzy --help")
  end
end
