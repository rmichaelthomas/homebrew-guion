class Guion < Formula
  desc "Programming language with readable syntax, explicit permissions and a built-in package registry"
  homepage "https://rmichaelthomas.github.io/guion/"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.10.0/guion-macos-aarch64.tar.gz"
      sha256 "98fbeed69192aa20fcba7b2f42c96d7e2114477ffddd2cd876d09cf8c4ef5043"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.10.0/guion-macos-x86_64.tar.gz"
      sha256 "c95e520dbdbca0d0ed9fc26dc279d6adef6a8f6ca121d1b7df05658bdb94ed1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.10.0/guion-debian-aarch64.tar.gz"
      sha256 "559523f4ffeafa9a4631336c5e2ea1467af271af1d522f4ef9fecbbb323063ea"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.10.0/guion-debian-x86_64.tar.gz"
      sha256 "6f24fc3dc0b4e3de014ffabeb70a73e99c474bdbfa78023ed7c45b79052ee9d5"
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
