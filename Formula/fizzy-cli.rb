class FizzyCli < Formula
  desc "CLI for https://fizzy.do"
  homepage "https://github.com/rogeriopvl/fizzy-cli"
  url "https://github.com/rogeriopvl/fizzy-cli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "86122de3d7682ff33580d46132f674380f52a4f99927ac613d1f1287e0b9ffe3"
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
