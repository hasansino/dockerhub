build:
	@docker buildx build --no-cache --platform linux/arm64 \
  --build-arg ARCH=arm64 \
	-t ghcr.io/hasansino/ghrunner:dev .

run:
	@docker run --rm -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /tmp/github-runner-1:/tmp/github-runner-1 \
  -e RUNNER_URL=https://github.com/hasansino/goapp \
  -e RUNNER_TOKEN=AA6WRATACG6LXOEIP3OB46LIEI4DK \
  -e RUNNER_WORKDIR=/tmp/github-runner-1 \
  -e ACTIONS_RUNNER_DEBUG=true \
  -e ACTIONS_STEP_DEBUG=true \
  ghcr.io/hasansino/ghrunner:dev

clean:
	@docker rmi ghcr.io/hasansino/ghrunner:dev