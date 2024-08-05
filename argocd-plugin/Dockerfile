FROM alpine

ARG TIMONI_VERSION=0.22.0

RUN apk update && apk add --no-cache \
    bash \
    curl \
    jq \
    yq

RUN curl -Lo /tmp/timoni.tar.gz "https://github.com/stefanprodan/timoni/releases/download/v${TIMONI_VERSION}/timoni_${TIMONI_VERSION}_linux_amd64.tar.gz" && \
    tar -xzf /tmp/timoni.tar.gz -C /usr/local/bin && \
    rm /tmp/timoni.tar.gz

RUN delgroup ping && \
    addgroup -g 998 ping && \
    adduser -D -u 999 argocd
USER argocd

RUN mkdir -p /home/argocd/cmp-server/config
COPY plugin.yaml /home/argocd/cmp-server/config/plugin.yaml

ENTRYPOINT [ "/var/run/argocd/argocd-cmp-server" ]