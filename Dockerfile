FROM docker:latest

RUN apk update
RUN apk upgrade
RUN apk add --update nodejs-current nodejs-npm zip unzip wget yarn
RUN apk add --no-cache python py-pip git
RUN apk add --no-cache build-base g++ cairo-dev jpeg-dev pango-dev freetype-dev giflib-dev
RUN pip install --upgrade pip
RUN pip install --upgrade awscli

#Install Terraform Version 0.12.23
RUN wget --quiet https://releases.hashicorp.com/terraform/0.12.23/terraform_0.12.23_linux_amd64.zip \
  && unzip terraform_0.12.23_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.12.23_linux_amd64.zip