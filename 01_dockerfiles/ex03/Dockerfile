FROM debian:9
RUN apt-get update && apt-get install -y curl openssh-server ca-certificates postfix
RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | bash
RUN apt-get install gitlab-ee

COPY script.sh ./
RUN chmod 755 ./script.sh
RUN service ssh start

EXPOSE 22
EXPOSE 443

ENTRYPOINT ["bash", "./script.sh"]

#docker run --name mygitlab -p 42:22 -p 8083:443 -it --privileged ooo
