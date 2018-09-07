GOROOT="$HOME/.go"

# only if it's not installed
[[ ! -d "$GOROOT" ]] || return 1

mkdir -p $GOROOT && curl https://dl.google.com/go/go1.11.linux-amd64.tar.gz | tar xzf - -C $GOROOT && mv $GOROOT/go/* $GOROOT && rmdir $GOROOT/go