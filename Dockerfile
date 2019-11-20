FROM mhart/alpine-node

MAINTAINER  icefrogisgreat@gmail.com


RUN \ 
    mkdir -p /opt/blog  && \
    cd /opt/blog    && \
    #apt-get update  && \
    #apt-get install -y nodejs npm && \
    #apt-get install -y git && \
    #npm config set registry https://registry.npm.taobao.org  && \
    apk add --update --no-cache git openssh && \
    npm install hexo-cli -g && \
    hexo init  && \
    git clone https://github.com/greatislee/myblogImages.git && \
    cp myblogImages/bakmk/*  /opt/blog/source/_posts/ && \
    rm /opt/blog/source/_posts/hello-world.md && \
    mkdir -p /opt/blog/source/about && \
    mv /opt/blog/source/_posts/index.md /opt/blog/source/about && \
    cd /opt/blog/themes && \
    git clone https://github.com/geekplux/hexo-theme-typing.git


WORKDIR /opt/blog
VOLUME ["/opt/blog"]

COPY ./dockerfile/install.sh  /install.sh
COPY ./dockerfile/_config.yml_hexo  /opt/blog/_config.yml
COPY ./dockerfile/_config.yml_themes /opt/blog/themes/hexo-theme-typing/_config.yml
COPY ./dockerfile/favicon.ico  /opt/blog/themes/hexo-theme-typing/source/images

#RUN \ 
#    cd /opt/blog/ && \
#    rm _config.yml && \
#    mv _config.yml_hexo _config.yml && \
#    cd themes/  && \
#    mv _config.yml_themes _config.yml

RUN chmod +x /install.sh
ENTRYPOINT [ "/install.sh" ]

#EXPOSE 4000

CMD ['init']

