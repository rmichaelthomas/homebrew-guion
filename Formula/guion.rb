class Guion < Formula
  desc "Programming language with readable syntax, explicit permissions and a built-in package registry"
  homepage "https://rmichaelthomas.github.io/guion/"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.9.0/guion-macos-aarch64.tar.gz"
      sha256 "f623c28508ea2c41675c5131d2ecfe27beb6ee2ade59cfa0c565163698cbd620"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.9.0/guion-macos-x86_64.tar.gz"
      sha256 "0337c5a1c5525ce96a25d1cb7a494752536b71ed1deaa0ecc92a1dc27f6d4263"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.9.0/guion-debian-aarch64.tar.gz"
      sha256 "3e6639c78837c8d793e440059d81836406187f26efe21499112c3e8296c0aefc"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.9.0/guion-debian-x86_64.tar.gz"
      sha256 "0c15e6c68d9a01f7be2b65187c5c4b8b0c8e3dbb63110d6c6eef268a3fef9bf2"
    end
  end

  def install
    # The binary finds its standard library at ../share/guion/stdlib, so keep the archive's layout.
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/guion"
  end

  test do
    (testpath/"main.gu").write <<~EOS
      import "std:text"

      fn main() -> Unit:
          print("ok")
    EOS
    assert_equal "ok\n", shell_output("#{bin}/guion run main.gu")
  end
end
