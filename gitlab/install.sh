export GITLAB_HOME=/srv/gitlab


sudo docker run --detach \
  --hostname gitlab.max-paloma-babbie.xyz \
  --publish 444:443 --publish 88:80 --publish 24:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
 gitlab/gitlab-ee:nightly

