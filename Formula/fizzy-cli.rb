class FizzyCli < Formula
  desc "CLI for https://fizzy.do"
  homepage "https://github.com/rogeriopvl/fizzy-cli"
  url "https://github.com/rogeriopvl/fizzy-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b93c9136d18c1b5e31951cb6f5ffbdd59b0e1689160b6579baba07f5f7c9007f"
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
