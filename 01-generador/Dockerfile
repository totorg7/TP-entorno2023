
FROM ubuntu:latest
MAINTAINER Tomás, Valentín

RUN apt-get update
RUN apt-get install -y cron
RUN apt install vim -y
RUN apt install file -y
RUN apt install ffmpeg -y --fix-missing
RUN apt install imagemagick-6.q16 -y

ADD ["generador-archivos.sh", "."]
ADD ["etc/cron.d/cron", "/etc/cron.d/cron"]

RUN chmod u+x generador-archivos.sh
RUN crontab /etc/cron.d/cron

ENTRYPOINT ["./generador-archivos.sh"]
