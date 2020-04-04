FROM ubuntu:latest
RUN apt-get update && apt-get -y install cron ca-certificates
WORKDIR /root
COPY main .
COPY config .
COPY scrapper-cron /etc/cron.d/scrapper-cron

RUN chmod 0644 /etc/cron.d/scrapper-cron
RUN crontab /etc/cron.d/scrapper-cron
RUN touch /var/log/cron.log
CMD ["cron", "-f"]