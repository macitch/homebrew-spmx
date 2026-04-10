class Spmx < Formula
  desc "The dependency commands Swift Package Manager forgot to ship"
  homepage "https://github.com/macitch/spmx"
  url "https://github.com/macitch/spmx/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6ac430f99bfdf9719640d59c6a065a45aec0a6f984a8cc406659bbe8b9137e92"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/spmx"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/spmx --version")
  end
end
