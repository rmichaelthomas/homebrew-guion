class Guion < Formula
  desc "Programming language with readable syntax, explicit permissions and a built-in package registry"
  homepage "https://rmichaelthomas.github.io/guion/"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.8.0/guion-macos-aarch64.tar.gz"
      sha256 "995d7f84d51a064fdcc41799dc2778ef73e54ee09436e813cc684e94f25f93ec"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.8.0/guion-macos-x86_64.tar.gz"
      sha256 "99efe72e898981714f5d95df4ce000763e2c562b079affff9e0399b1f698d103"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.8.0/guion-debian-aarch64.tar.gz"
      sha256 "5bf4ae97292b2f43af6df869f7a34d87af67220657ecfb6c5f9c32dfa3cc2fb8"
    end
    on_intel do
      url "https://github.com/rmichaelthomas/guion/releases/download/v0.8.0/guion-debian-x86_64.tar.gz"
      sha256 "5ec6b04c0fdbade8bafec462bac86b6ce6257e4638d90130bb4f01be3a47eba3"
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
