FROM ghcr.io/cirruslabs/flutter:3.22.3

RUN rm /root/.gitconfig

RUN apt update && apt install -y llvm clang

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.0/zsh-in-docker.sh)" \
    -t robbyrussell 

RUN git config --global --add safe.directory '*'