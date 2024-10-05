FROM golang:latest

RUN go version

ENV CGO_ENABLED=0
ENV GOPROXY=direct
ENV GOSUMDB=off

RUN go install github.com/go-delve/delve/cmd/dlv@latest

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]

EXPOSE 80
EXPOSE 8080
EXPOSE 40000
