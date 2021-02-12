#!/usr/bin/env bash

CLDBIN=/usr/bin/gclone
OSARCH=$(uname -m)
case $OSARCH in 
    x86_64)
        BINTAG=Linux_x86_64
        ;;
    i*86)
        BINTAG=Linux_i386
        ;;
    arm64)
        BINTAG=Linux_arm64
        ;;
    arm*)
        BINTAG=Linux_armv6
        ;;
    *)
        echo "unsupported OSARCH: $OSARCH"
        exit 1
        ;;
esac

wget -qO- https://api.github.com/repos/donwa/gclone/releases/latest \
| grep browser_download_url | grep "$BINTAG" | cut -d '"' -f 4 \
| wget --no-verbose -i- -O- | gzip -d -c > ${CLDBIN}
chmod 0755 ${CLDBIN}

gclone version
