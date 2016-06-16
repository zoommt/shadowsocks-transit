FROM alpine:latest

RUN apk update \
 && apk add --no-cache haproxy
 
COPY haproxy.cfg /etc/haproxy/haproxy.cfg

EXPOSE 8389

ENV SS_TRANSIT_ORIGIN "127.0.0.1:8388"

CMD sed -i "s/127.0.0.1:8388/$SS_TRANSIT_ORIGIN/g" /etc/haproxy/haproxy.cfg \
 && haproxy -f /etc/haproxy/haproxy.cfg
