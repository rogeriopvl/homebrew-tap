class FizzyCli < Formula
  desc "CLI for https://fizzy.do"
  homepage "https://github.com/rogeriopvl/fizzy-cli"
  url "https://github.com/rogeriopvl/fizzy-cli/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "84cc427136866fdec5ae4899a7c184b5e439fc5b6ed40d28a3acc8aea6fb5712"
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
