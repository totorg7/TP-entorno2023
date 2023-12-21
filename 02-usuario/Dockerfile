FROM ubuntu:latest
MAINTAINER Tomás, Valentín

WORKDIR app

ADD codigos/ .
RUN chmod +x menu.sh
RUN chmod +x clasificador.sh
RUN chmod +x palindromos.sh
RUN chmod +x statswords.sh
RUN chmod +x email.sh
RUN chmod +x monitor.sh

ENTRYPOINT ["bash", "menu.sh"]

