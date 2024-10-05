# GitHub actions runner

## Environment:                       

  * RUNNER_URL [string]
  * RUNNER_TOKEN [string]
  * ACTIONS_RUNNER_DEBUG [bool]
  * ACTIONS_STEP_DEBUG [bool]
## docker-compose example

```json
  github-runner:
    image: hasansino/github-runner:latest
    environment:
      RUNNER_URL: "https://github.com/hasansino/dockerhub"
      RUNNER_TOKEN: "qwerty"
      ACTIONS_RUNNER_DEBUG: "true"
      ACTIONS_STEP_DEBUG: "true"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```
