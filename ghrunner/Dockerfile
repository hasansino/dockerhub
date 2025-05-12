FROM ubuntu:24.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG ARCH=amd64
ARG RUNNER_VERSION=2.323.0

ARG USER_ID=1001
ARG GROUP_ID=121

ENV DEBIAN_FRONTEND=noninteractive
ENV ACTIONS_RUNNER_DEBUG=false
ENV ACTIONS_STEP_DEBUG=false
ENV RUNNER_URL=""
ENV RUNNER_TOKEN=""
ENV RUNNER_WORKDIR="/ghrunner/_work"
ENV CGO_ENABLED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    locales ca-certificates apt-transport-https \
    sudo gosu curl tar unzip zip git jq make gpg gnupg libicu-dev lsb-release \
    build-essential gcc libc6-dev cppcheck

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && apt-get install -y --no-install-recommends \
    docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
   
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

RUN mkdir /ghrunner
RUN curl -o /tmp/runner.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-${ARCH}-${RUNNER_VERSION}.tar.gz \
    && tar -xzf /tmp/runner.tar.gz -C /ghrunner && rm /tmp/runner.tar.gz

RUN ./ghrunner/bin/installdependencies.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

RUN echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN groupadd -g ${GROUP_ID} userg
RUN useradd -mr user -u ${USER_ID} -g ${GROUP_ID}
RUN usermod -aG docker user && usermod -aG sudo user
RUN mkdir -p ${RUNNER_WORKDIR}
RUN chown -R user:userg /ghrunner ${RUNNER_WORKDIR}
USER user

WORKDIR /ghrunner

CMD ["./bin/Runner.Listener", "run", "--startuptype", "service"]
