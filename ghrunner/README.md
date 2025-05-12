# github actions runner

+ github-runner v2.323.0
+ docker-in-docker service
+ [cppcheck](https://cppcheck.sourceforge.io/)

## environment

+ RUNNER_URL [string]
+ RUNNER_TOKEN [string]
+ RUNNER_WORKDIR [string]
+ ACTIONS_RUNNER_DEBUG [bool]
+ ACTIONS_STEP_DEBUG [bool]

## example with docker-compose

```yaml
  github-runner:
    image: ghcr.io/hasansino/github-runner:latest
    privileged: true
    environment:
      RUNNER_URL: https://github.com/hasansino/dockerhub
      RUNNER_TOKEN: AAABBBCCC
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /tmp/github-runner:/tmp/github-runner # must much
```
