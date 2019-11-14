FROM ubuntu:18.04

MAINTAINER  icefrogisgreat@gmail.com


RUN \ 
    mkdir -p /opt/blog  && \
    cd /opt/blog    && \
    apt-get update  && \
    apt-get install -y nodejs npm && \
    apt-get install -y git && \
    #npm config set registry https://registry.npm.taobao.org  && \
    npm install hexo-cli -g  && \
    hexo init 


WORKDIR /opt/blog
VOLUME ["/opt/blog"]

COPY install.sh  /install.sh
RUN chmod +x /install.sh
ENTRYPOINT [ "/install.sh" ]

EXPOSE 9090

CMD [ "init" ]

