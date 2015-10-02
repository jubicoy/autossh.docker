FROM debian:jessie

RUN apt-get update && apt-get install -y autossh && rm -rf /var/lib/apt/lists/*

ADD start_autossh.sh /start_autossh.sh
ENTRYPOINT [ "/start_autossh.sh" ]
