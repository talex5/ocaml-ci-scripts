## basic OCaml and opam installation

set -uex

wget https://downloads.sourceforge.net/project/zero-install/0install/2.10/0install-linux-x86_64-2.10.tar.bz2
tar xjf 0install-linux-x86_64-2.10.tar.bz2
cd 0install-linux-x86_64-2.10
./install.sh home
export PATH=$HOME/bin:$PATH
0install add opam http://tools.ocaml.org/opam.xml

# the ocaml version to test
OPAM_INIT=${OPAM_INIT:-true}
OPAM_SWITCH=${OPAM_SWITCH:-system}

# the base opam repository to use for bootstrapping and catch-all namespace
BASE_REMOTE=${BASE_REMOTE:-git://github.com/ocaml/opam-repository}

ocaml -version

# whether we need a new gcc and binutils
UPDATE_GCC_BINUTILS=${UPDATE_GCC_BINUTILS:-"0"}

# Install Trusty remotes
UBUNTU_TRUSTY=${UBUNTU_TRUSTY:-"0"}

case "$OCAML_VERSION" in
    latest) OCAML_VERSION=4.02;;
esac

export OPAMYES=1

case $OPAM_INIT in
  true)
      opam init -a "$BASE_REMOTE" --comp="$OPAM_SWITCH"
      eval $(opam config env)
      ;;
esac

opam --version
opam --git-version
