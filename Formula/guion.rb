class Guion < Formula
  desc "Programming language with readable syntax, explicit permissions and a built-in package registry"
  homepage "https://rmichaelthomas.github.io/guion/"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.9.1/guion-macos-aarch64.tar.gz"
      sha256 "5b183906db1ffc6fc0526fdc10d51494c4e29ce298477ab6b95c2bc2abfeb029"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.9.1/guion-macos-x86_64.tar.gz"
      sha256 "25ff0f42f38258ca1b65e7637740e7cb845f91da70b684e8d92cf1d573977bae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.9.1/guion-debian-aarch64.tar.gz"
      sha256 "c2989dad62df50b92c6fe5ec0439e172983bb860a96fd6a29c01687ff91900fd"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.9.1/guion-debian-x86_64.tar.gz"
      sha256 "3f96978bea336aececa57a060759c9e861efc4157d327fba2783f0afe18150e1"
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
