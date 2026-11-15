class Guion < Formula
  desc "Programming language with readable syntax, explicit permissions and a built-in package registry"
  homepage "https://rmichaelthomas.github.io/guion/"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.5.0/guion-macos-aarch64.tar.gz"
      sha256 "8e064347996bce8c5e78e515faba6e23fdb85011f965360b9999615569ca6cfc"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.5.0/guion-macos-x86_64.tar.gz"
      sha256 "deac7b612022e2e401096892d2e56a9eb00b0d57668b0f4092e16a87c717fb26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.5.0/guion-debian-aarch64.tar.gz"
      sha256 "b6ccd4990023dba2ad73ae125f4ddb8e1be9b478ef8f03c0fdd13aa4825116a6"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.5.0/guion-debian-x86_64.tar.gz"
      sha256 "305e267c1a83a09f2da5879360933cbbbb83740065df21b1e01002ca42430afb"
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
