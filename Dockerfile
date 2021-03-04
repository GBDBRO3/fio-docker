FROM alpine:3.13

VOLUME /data
COPY jobs /jobs
RUN apk add --no-cache fio==3.25-r0 && \
addgroup -S fio && adduser -S fio -G fio && \
chown -R fio:fio /data

WORKDIR /data
USER 1001

ENTRYPOINT [ "fio" ]
