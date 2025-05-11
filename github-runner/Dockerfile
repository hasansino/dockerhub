FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV RUNNER_URL=""
ENV RUNNER_TOKEN=""

RUN apt-get update && apt-get install -y \
    curl tar git jq make libicu-dev apt-transport-https ca-certificates gnupg lsb-release \
    cppcheck \
    && apt-get clean

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y \
    docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
    && apt-get clean

RUN useradd -m github-runner && usermod -aG docker github-runner

RUN mkdir /actions-runner
WORKDIR /actions-runner

RUN curl -o actions-runner-linux-x64-2.323.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz \
    && tar -xzf actions-runner-linux-x64-2.323.0.tar.gz \
    && rm actions-runner-linux-x64-2.323.0.tar.gz

RUN ./bin/installdependencies.sh

RUN chown -R github-runner:github-runner /actions-runner

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER github-runner

ENTRYPOINT ["/entrypoint.sh"]
