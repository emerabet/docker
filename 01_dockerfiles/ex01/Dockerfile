FROM debian:9

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install bzip2 -y && \
	apt-get install wget -y
RUN wget http://dl.4players.de/ts/releases/3.5.0/teamspeak3-server_linux_amd64-3.5.0.tar.bz2
RUN tar -xvf teamspeak3-server_linux_amd64-3.5.0.tar.bz2 && \
	rm teamspeak3-server_linux_amd64-3.5.0.tar.bz2
WORKDIR  /teamspeak3-server_linux_amd64/
RUN touch .ts3server_license_accepted

EXPOSE 9987/udp
EXPOSE 30033
EXPOSE 10011

CMD ["sh", "ts3server_minimal_runscript.sh"]
