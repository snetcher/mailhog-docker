FROM alpine:3.5
MAINTAINER Alexey Diyan <alexey.diyan@gmail.com>

# Install ca-certificates, required for the "release message" feature.
RUN set -x \
  && adduser -D -u 1000 mailhog \
  && apk add --no-cache ca-certificates \
  && apk add --no-cache --virtual build-dependencies go git musl-dev \
  && GOPATH=/tmp/gocode go get github.com/mailhog/MailHog \
  && mv /tmp/gocode/bin/MailHog /usr/local/bin/ \
  && apk --no-cache del --purge build-dependencies \
  && rm -rf /tmp/*

EXPOSE 1025 8025
USER mailhog
WORKDIR /home/mailhog
ENTRYPOINT ["MailHog"]
