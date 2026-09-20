class Spmx < Formula
  desc "Dependency tools for Swift Package Manager"
  homepage "https://github.com/macitch/spmx"
  url "https://github.com/macitch/spmx/releases/download/v0.2.0/spmx-0.2.0-macos.tar.gz"
  sha256 "6033e035a54aadbdc7bfb3462fe416fb771196e98737cbf378251b6d4983f416"
  license "MIT"
  head "https://github.com/macitch/spmx.git", branch: "main"

  depends_on macos: :ventura
  depends_on xcode: ["16.0", :build] if build.head?

  def install
    if build.head?
      system "swift", "build", "-c", "release", "--disable-sandbox"
      build_path = Utils.safe_popen_read("swift", "build", "-c", "release", "--show-bin-path").strip
      bin.install "#{build_path}/spmx"
    else
      bin.install "spmx"
    end
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/spmx --version"))
    assert_match "USAGE:", shell_output("#{bin}/spmx add --help")
    assert_match "complete", shell_output("#{bin}/spmx completions bash")
  end
end
