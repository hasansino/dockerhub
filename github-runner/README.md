# GitHub actions runner

GitHub actions runner in cointainer. Version linux-x64-2.319.1.

## Environment:                       

  * RUNNER_URL [string]
  * RUNNER_TOKEN [string]
  * ACTIONS_RUNNER_DEBUG [bool]
  * ACTIONS_STEP_DEBUG [bool]

## Example with docker-compose

```yaml
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
