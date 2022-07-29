FROM alpine

ENV PAGER="less"

# Install packages
RUN set -xe \
    && apk update && apk add --update --no-cache \
    git \
    bash \
    less \
    groff \
    curl \
    openssh \
    python3 \
    py3-pip \
    py-cryptography \
    wget \
    curl \
    openssh-client \
    tree

RUN apk --no-cache add --virtual builds-deps build-base python3

# Install AWSCLI
RUN pip install --upgrade pip \
        setuptools_rust \
        awsebcli --ignore-installed \
        awscli


ENV PATH /root/.ebcli-virtual-env/executables:$PATH

RUN curl -L https://github.com/barnybug/cli53/releases/download/0.8.16/cli53-linux-386 > /usr/bin/cli53 && \
    chmod +x /usr/bin/cli53

# Expose credentials volume
RUN mkdir ~/.aws
