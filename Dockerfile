FROM alpine:3.15

RUN apk update && \
    apk add --no-cache ruby
