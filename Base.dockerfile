ARG BASE_IMAGE=ubuntu:21.10
FROM ${BASE_IMAGE}
LABEL maintainer="githubzilla"

ARG USER=devuser
ARG PW=passwd01

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y sudo iputils-ping net-tools wget curl telnet git zsh fonts-powerline llvm llvm-dev clang clangd gdb lldb build-essential ranger software-properties-common ripgrep fd-find pkg-config trash-cli tmux pandoc lynx python3-pip elfutils

#install latest neovim
ADD files/nvim-0.6.1.tar.gz /
RUN ln -s /nvim/bin/nvim /usr/bin/nvim && pip install pynvim #require by vimspector

#add developer user account
RUN adduser --quiet --disabled-password --shell /bin/zsh --home /home/${USER} --gecos "User" ${USER} && \
    echo "${USER}:${PW}" | chpasswd &&  usermod -aG sudo ${USER}

#switch user
USER ${USER}
WORKDIR /home/${USER}

#Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /home/${USER}/rustup.sh 
RUN chmod +x /home/${USER}/rustup.sh && /home/${USER}/rustup.sh -y && rm /home/${USER}/rustup.sh
RUN . /home/${USER}/.cargo/env && \
    rustup toolchain install nightly && \
    rustup default nightly && \
    rustup component add rust-src && \
    rustup +nightly component add rust-analyzer-preview

#setup oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh && \
    git clone https://github.com/zsh-users/zsh-autosuggestions /home/${USER}/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
    git clone https://github.com/romkatv/powerlevel10k.git && \
    /home/${USER}/powerlevel10k/gitstatus/install
# run gitstatusd install when docker build rather than postpone to the actuall run time  

#add oh-my-zsh config files
ADD --chown=${USER}:${USER} files/dotzshrc /home/${USER}/.zshrc
ADD --chown=${USER}:${USER} files/dotp10k.zsh /home/${USER}/.p10k.zsh
ADD --chown=${USER}:${USER} files/dotprofile /home/${USER}/.profile

#Install vim-plug for neovim
RUN mkdir -p /home/${USER}/.local/share/nvim/site/autoload
ADD --chown=${USER}:${USER} files/plug.vim /home/${USER}/.local/share/nvim/site/autoload/plug.vim

#add neovim config files
ADD --chown=${USER}:${USER} files/nvim /home/${USER}/.config/nvim
USER root
RUN chown -R ${USER}:${USER} /home/${USER}/.config
USER ${USER}
#run plug install
RUN nvim --headless +silent +PlugInstall +qall && nvim --headless +silent +TSInstall rust c cpp javascript css html +qall
#run treesitter Install

#install nvm
USER root
RUN mkdir /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 17.2.0
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
# install node and npm
RUN . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && npm install -g typescript


USER ${USER}
ENV TERM xterm-256color
CMD ["zsh"]
