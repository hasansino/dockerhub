FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --fix-broken curl tar git jq cppcheck make libicu-dev \
    && apt-get clean

RUN useradd -m github-runner

RUN mkdir /actions-runner

WORKDIR /actions-runner

RUN curl -o actions-runner-linux-x64-2.323.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz

RUN tar -xzf actions-runner-linux-x64-2.323.0.tar.gz

RUN chown -R github-runner:github-runner /actions-runner

ENV RUNNER_URL=""
ENV RUNNER_TOKEN=""

RUN ./bin/installdependencies.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER github-runner

ENTRYPOINT ["/entrypoint.sh"]
