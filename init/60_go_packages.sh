GOROOT="$HOME/.go"

# Sanity check that we have go available
[[ -d "$GOROOT" ]] || return 1

GOPATH="$HOME/.local/go"

$GOROOT/bin/go get -u github.com/dotzero/git-profile
