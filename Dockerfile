FROM alpine:3.3

RUN apk add --no-cache tinydns

ENV GID tinydns
ENV UID tinydns
ENV IP 0.0.0.0
ENV ROOT /etc/tinydns
EXPOSE 53/udp
CMD "tinydns"
