FROM debian:9
RUN apt-get update && apt-get install -y curl openssh-server ca-certificates postfix
RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | bash
RUN apt-get install gitlab-ee

RUN echo "#!/bin/bash \n \
sed -i \"s|http://gitlab.example.com|https://192.168.99.100:8083|g\" /etc/gitlab/gitlab.rb \n \
echo \"letsencrypt['enable'] = true\" >> /etc/gitlab/gitlab.rb \n \
echo \"gitlab_rails['gitlab_shell_ssh_port'] = 42\" >> /etc/gitlab/gitlab.rb \n \
echo \"nginx['listen_port'] = 443\" >> /etc/gitlab/gitlab.rb \n \
service ssh start \n \
/opt/gitlab/embedded/bin/runsvdir-start& \n \
gitlab-ctl reconfigure \n \
tail -f /dev/null" > script.sh

RUN chmod 755 ./script.sh
RUN service ssh start

EXPOSE 22
EXPOSE 443

ENTRYPOINT ["bash", "./script.sh"]

# docker run --name mygitlab -p 42:22 -p 8083:443 -i --privileged ooo
# For HTTPS clone
# git -c http.sslVerify=false clone xxxxxxxxxxxxxxxxxxxxxxx
