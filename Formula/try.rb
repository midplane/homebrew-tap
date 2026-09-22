class Try < Formula
  desc "Fuzzy-find an experiment directory, or create a dated one"
  homepage "https://github.com/midplane/simple-try"
  url "https://github.com/midplane/simple-try/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "77c930cdabde98ec1f694132615327ceb43b81353e2edeeb8f1e87ae926bcadf"
  license "MIT"

  depends_on "fzf"

  def install
    bin.install "try.sh" => "try"
  end

  def caveats
    <<~EOS
      `try` only prints a path — it can't `cd` your shell for you. Add the
      integration to your shell's rc file so `try` changes directory:

        # bash / zsh
        eval "$(#{bin}/try init)"

        # fish
        #{bin}/try init --fish | source
    EOS
  end

  test do
    assert_match "usage", shell_output("#{bin}/try new 2>&1", 1)
  end
end
