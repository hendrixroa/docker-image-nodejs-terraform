FROM node:14-alpine

RUN apk update && apk upgrade && \
    apk --no-cache --virtual build-dependencies add \
    git \
    zip \
    unzip \
    wget \
    yarn \
    curl \
    bash \
    g++ \
    build-base \
    docker \
    py-pip \
    python3-dev \
    libffi-dev \
    openssl-dev \
    gcc \
    libc-dev \
    make && \
    rm -rf /var/cache/apk/*

RUN pip3 install --upgrade pip  --no-cache-dir
RUN pip3 install --upgrade awscli  --no-cache-dir
RUN pip3 install docker-compose --no-cache-dir

# Declare constants
ENV TERRAFORM_VERSION 0.13.2

#Install Terraform
RUN wget --quiet https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
