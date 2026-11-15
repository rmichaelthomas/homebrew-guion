class Guion < Formula
  desc "Programming language with readable syntax, explicit permissions and a built-in package registry"
  homepage "https://rmichaelthomas.github.io/guion/"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.6.0/guion-macos-aarch64.tar.gz"
      sha256 "001b797c6bf3472ec497988b535a84b335e67c5ac7d19cb852a763a70db086d2"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.6.0/guion-macos-x86_64.tar.gz"
      sha256 "c05bba761ad526c7aeb4e91b77b9a26e20e0176f1d1fed829ee193391f0a351a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.6.0/guion-debian-aarch64.tar.gz"
      sha256 "80107281055d1a6af0f0ba4bd7f3ef3d9eb7282c43373ab1f8d70854198ce8c7"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.6.0/guion-debian-x86_64.tar.gz"
      sha256 "88a87029166457dfa10d9458b8534a3291a841c85579250ccff8ac1d00ddaf9c"
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
