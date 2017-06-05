FROM alpine:3.6
MAINTAINER zhouyq@goodrain.com

# china repositories mirror
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

# modify timezone and install the necessary software
RUN apk add --no-cache tzdata libc6-compat tar sed wget curl bash su-exec && \
       sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd && \
       ln -s /lib /lib64 && \
       cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
       echo "Asia/Shanghai" >  /etc/timezone && \
       date && apk del --no-cache tzdata


RUN apk add --no-cache alpine-sdk

CMD ["bash"]
