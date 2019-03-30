FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    unzip \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get update && apt-get install -y \
    nodejs=8* \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /workspace/ghost

RUN curl -sL https://github.com/TryGhost/Ghost/releases/download/1.22.3/Ghost-1.22.3.zip -o /tmp/ghost.zip

RUN unzip /tmp/ghost.zip -d /workspace/ghost

RUN cd /workspace/ghost && npm -s install
