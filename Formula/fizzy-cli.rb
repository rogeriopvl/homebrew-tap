class FizzyCli < Formula
  desc "CLI for https://fizzy.do"
  homepage "https://github.com/rogeriopvl/fizzy-cli"
  url "https://github.com/rogeriopvl/fizzy-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "102a4fb87a991aee3dd43a9dd2752363cdf560859873db243d99508c5a75bccf"
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
