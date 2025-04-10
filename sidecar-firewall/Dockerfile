FROM alpine:latest
RUN apk add --no-cache iptables
COPY rules/* /etc/iptables/
RUN chmod +x /etc/iptables/*
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "fw_init" ]
