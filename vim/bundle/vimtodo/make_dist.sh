#!/bin/bash
[[ -z $1 ]] && {
    echo "Usage: $0 [tag]"
    exit 1
}
TAG=$1
# Strip out any 'v' from the tag when making the filename (e.g. v0.1 -> 0.1)
VER=${TAG#v}

echo "Tagging $TAG"
git tag -s -m "Tagging $TAG" $TAG
cd ..
echo "Making tarball - vimtodo-$VER.tgz"
tar cz --exclude={.gitignore,.git,make_dist.sh,vimball.vim,*.swp} \
    --exclude=vimtodo/test/*.{msgout,out,tap} \
    --exclude=vimtodo/doc/tags \
    --exclude=vimtodo.vba \
    -f vimtodo-$VER.tgz vimtodo
