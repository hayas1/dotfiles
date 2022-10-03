#! /bin/bash -e
# this script build python from source, so this will take a little time.

PYVERSION=${PYTHON_VERSION:-"latest"}
PYVERSION=${1:-$VERSION}

# get python version
VERSION=${PYVERSION:-"latest"}
if [[ $VERSION =~ [0-9]+\.[0-9]+\.[0-9]+ ]]; then
    echo "install python $VERSION ..."
else
    PYTHON_DL_URL='https://www.python.org/ftp/python/'
    # https://stackoverflow.com/questions/65311659/getting-the-latest-python-3-version-programmatically
    if [ "$VERSION" = "latest" ]; then
        REGEX="s!.*<a href=\"\([0-9]\+\.[0-9]\+\.[1-9]\+\)/\">.*!\1!p"
    elif [[ "$VERSION" =~ [0-9]+\.[0-9]+ ]]; then
        REGEX="s!.*<a href=\"\($VERSION\.[1-9]\+\)/\">.*!\1!p"
    elif [[ "$VERSION" =~ [0-9]+ ]]; then
        REGEX="s!.*<a href=\"\($VERSION\.[0-9]\+\.[1-9]\+\)/\">.*!\1!p"
    fi
    VERSIONS=$(curl -fsL "$PYTHON_DL_URL" | sed -n "$REGEX" | sort -rV)
    VERSION=$(echo "$VERSIONS" | head -n 1)
    VERSION=${VERSION:=$1}
    echo "install python $VERSION ..."
fi

# install python
TMP_DIR=$(mktemp -dt "work.python.$(date +%Y%m%d%H%M%S).XXXXXX")
INSTALL_PATH="/usr/local/lib/python$VERSION"
apt-get update -y && apt-get install -y build-essential zlib1g-dev libssl-dev

wget -P "$TMP_DIR/" "https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz"
tar xf "$TMP_DIR/Python-$VERSION.tgz" -C "$TMP_DIR"
cd "$TMP_DIR/Python-$VERSION"
./configure --prefix="$INSTALL_PATH" --with-ssl
make && make install

ln -s "$INSTALL_PATH/bin/python3" /usr/bin/python
ln -s "$INSTALL_PATH/bin/pip3" /usr/bin/pip
ln -s "$INSTALL_PATH/bin/idle3" /usr/bin/idle
ln -s "$INSTALL_PATH/bin/python3-config" /usr/bin/python-config
