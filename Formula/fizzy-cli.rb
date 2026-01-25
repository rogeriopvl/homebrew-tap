class FizzyCli < Formula
  desc "CLI for https://fizzy.do"
  homepage "https://github.com/rogeriopvl/fizzy-cli"
  url "https://github.com/rogeriopvl/fizzy-cli/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "c599ebbc132184365e56e21444a3c3c5dcc42ecc722ceb870265022aacd5d76f"
  license "MIT"
  head "https://github.com/rogeriopvl/fizzy-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"fizzy", ldflags: "-s -w")
  end

  test do
    assert_match "Fizzy CLI", shell_output("#{bin}/fizzy --help")
  end
end
