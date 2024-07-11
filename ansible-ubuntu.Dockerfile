FROM ubuntu:jammy as base
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
ARG PLAYBOOK
# I can go with either adding repos or using pip
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common python3.10 python3.10-venv git unzip python3-pip curl

RUN pip3 install pipx
RUN pipx install --include-deps ansible

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH=$PATH:/root/.local/bin

FROM base
COPY . .
CMD [ "sh", "-c", "ansible-playbook $PLAYBOOK.yml" ]
