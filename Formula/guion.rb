class Guion < Formula
  desc "Programming language with readable syntax, explicit permissions and a built-in package registry"
  homepage "https://rmichaelthomas.github.io/guion/"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.7.0/guion-macos-aarch64.tar.gz"
      sha256 "1e597916f9b1a2b74f35f2178853563c9a5c4f8572216f1d453d0ada6f54a9b1"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.7.0/guion-macos-x86_64.tar.gz"
      sha256 "4a9114322ffaea1096b7c1d8ea242561e93a799a146a77ed182b739b622855ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.7.0/guion-debian-aarch64.tar.gz"
      sha256 "deda2c4610ac321607fe4bd0698ec1d184dcee2b5942c1ac0a3ddb504f2fb10d"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.7.0/guion-debian-x86_64.tar.gz"
      sha256 "f00c76afa7e22a77061de76a2e2761a6501167c6b13bcbdc07fa605e506d93a8"
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
