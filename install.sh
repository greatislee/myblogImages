#!/bin/bash


#if [ "$1" = 'init'  ]; then
    #cd /opt/blog
    #hexo init
    #npm install 
if [ "$1" = 'bash'  ]; then
    /bin/bash
elif [ "$1" = 'update' ]; then
    cd /opt/blog
    npm install hexo-generator-sitemap --save
else 
    cd /opt/blog
    echo "$1"
    hexo "$1"
fi
