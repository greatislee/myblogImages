#!/bin/sh

GITMAIL="icefrogisgreat@gmail.com"
GITUSER="greatislee"

if [ "$1" = 'bash'  ]; then
    /bin/sh
elif [ "$1" = 'deploy' ]; then
    cd /opt/blog
    git config --global user.email "$GITMAIL"
    git config --global user.name "$GITUSER"
    hexo g
    hexo d
else 
    cd /opt/blog
    echo "$1"
    hexo "$1"
fi
