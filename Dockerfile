FROM golang:1.18.1-alpine3.15
RUN adduser -S user
WORKDIR /home/user
COPY data .
RUN apk add --no-cache gettext
RUN go install github.com/buraksezer/gsocks5@latest
USER user
#Reads server password and port from environment variables.
CMD cat server.json | envsubst > server2.json && /go/bin/gsocks5 -c server2.json