FROM golang:latest

ENV CGO_ENABLED 0
ENV GO111MODULE auto
ENV GOPROXY direct
ENV GOSUMDB off

RUN go get github.com/derekparker/delve/cmd/dlv

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]

EXPOSE 80
EXPOSE 8080
EXPOSE 40000
