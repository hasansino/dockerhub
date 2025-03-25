FROM golang:1.24

RUN go install github.com/go-delve/delve/cmd/dlv@latest

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
