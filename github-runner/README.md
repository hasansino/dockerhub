# GitHub actions runner

+ github-runner linux-x64-2.323.0
+ [cppcheck](https://cppcheck.sourceforge.io/)
+ docker-in-docker

## Environment

+ RUNNER_URL [string]
+ RUNNER_TOKEN [string]
+ ACTIONS_RUNNER_DEBUG [bool]
+ ACTIONS_STEP_DEBUG [bool]

## Example with docker-compose

```yaml
  github-runner:
    image: ghcr.io/hasansino/github-runner:latest
    privileged: true
    environment:
      RUNNER_URL: "https://github.com/hasansino/dockerhub"
      RUNNER_TOKEN: "qwerty"
      ACTIONS_RUNNER_DEBUG: "true"
      ACTIONS_STEP_DEBUG: "true"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```
