ARG CODE_SERVER_VERSION

FROM codercom/code-server:${CODE_SERVER_VERSION}

RUN sudo bash -c '\
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.4/fixuid-0.4-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: coder\ngroup: coder\n" > /etc/fixuid/config.yml'

ENTRYPOINT ["fixuid", "dumb-init", "code-server", "--host", "0.0.0.0"]
