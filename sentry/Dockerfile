FROM sentry:9.1.2

# Allow sentry to run from root user
ENV C_FORCE_ROOT true

# Create log directory
RUN mkdir /var/log/sentry

# Entrypoint configuration
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["sentry"]

# Sentry UI will run on 80 port
EXPOSE 80
