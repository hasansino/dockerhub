FROM python:3.13

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    build-essential && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    curl -LsSf https://astral.sh/uv/install.sh | sh && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

ENV PATH="/root/.local/bin:${PATH}"

ENV PATH="/root/.cargo/bin:${PATH}"

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
