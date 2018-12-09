#!/bin/bash
sed -i "s|http://gitlab.example.com|https://192.168.99.100:8083|g" /etc/gitlab/gitlab.rb
echo "letsencrypt['enable'] = true" >> /etc/gitlab/gitlab.rb
echo "gitlab_rails['gitlab_shell_ssh_port'] = 42" >> /etc/gitlab/gitlab.rb
echo "nginx['listen_port'] = 443" >> /etc/gitlab/gitlab.rb
#EXTERNAL_URL="https://192.168.99.100"
service ssh start
/opt/gitlab/embedded/bin/runsvdir-start&
gitlab-ctl reconfigure
tail -f /dev/null
