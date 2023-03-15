# gitlab-runner

[![](https://github.com/soulkst/gitlab-runner/actions/workflows/docker-image.yml/badge.svg)](https://github.com/soulkst/gitlab-runner/actions/workflows/docker-image.yml)

## Docker hub
[soulkst/gitlab-runner](https://hub.docker.com/r/soulkst/gitlab-runner)

## About
- Added auto register script
- [Using CLI Environment](Environement.md)
- Tested version [15.9.1](https://hub.docker.com/layers/gitlab/gitlab-runner/v15.9.1/images/sha256-d493cf2a81455696e4e754b9ef6e8418f6ebe2e432b704bd00d140431bdbe0e9?context=explore)

## Important
- If already exists (and has contents) **/etc/gitlab-runner/config.toml**, no execute **'register'** command

## Quick start

#### Using docker-compose

```yaml
version: "3.9"
services:
  gitlab-runner:
    image: soulkst/gitlab-runner:latest
    container_name: gitlab-runner
    environment:
      TZ: Asia/Seoul
      REGISTRATION_TOKEN: $REGISTRATION_TOKEN
      CI_SERVER_URL: http://gitlab
      RUNNER_EXECUTOR: docker
      CLONE_URL: http://gitlab
      DOCKER_IMAGE: "*"
```

### Run with docker-in-docker rootless
- Chetck out example file [docker-compose.yml](docker-compose.yml)

## Build

```bash
# docker build [PATH] -t [namespace]/gitlab-runner:latest
docker build --force-rm -t soulkst/gitlab-runner:latest .
```

# Reference
- [https://docs.gitlab.com/runner/executors/docker.html](https://docs.gitlab.com/runner/executors/docker.html)
- [https://github.com/FlakM/gitlab-runner-auto-register](https://github.com/FlakM/gitlab-runner-auto-register)
- [https://docs.docker.com/engine/security/rootless/#rootless-docker-in-docker](https://docs.docker.com/engine/security/rootless/#rootless-docker-in-docker)
- [https://bravenamme.github.io/2020/09/16/gitlab-runner-deploy-with-docker/](https://bravenamme.github.io/2020/09/16/gitlab-runner-deploy-with-docker/)