FROM docker:latest

MAINTAINER Dmitriy Safronov <zimniy@cyberbrain.pw>
ENV LANG C.UTF-8

########################################################################################

RUN apk --update add --no-cache dcron \
   && rm -rf /var/cache/apk/*

RUN mkdir -p /var/log/cron && mkdir -m 0644 -p /var/spool/cron/crontabs && touch /var/log/cron/cron.log && mkdir -m 0644 -p /etc/cron.d
COPY /scripts/* /

ENTRYPOINT ["/docker-entry.sh"]
CMD ["/docker-cmd.sh"]
