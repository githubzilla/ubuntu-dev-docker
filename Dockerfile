FROM ubuntu:21.10
LABEL maintainer="githubzilla"

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y iputils-ping
RUN apt-get install -y net-tools
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y telnet
RUN apt-get install -y git
RUN apt-get install -y zsh
RUN apt-get install -y fonts-powerline
RUN apt-get install -y llvm
RUN apt-get install -y llvm-dev
RUN apt-get install -y clang
RUN apt-get install -y clangd
RUN apt-get install -y build-essential
RUN apt-get install -y ranger
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update
RUN apt-get install -y neovim

#add developer user account
RUN adduser --quiet --disabled-password --shell /bin/zsh --home /home/devuser --gecos "User" devuser && \
    echo "devuser:p@ssword1" | chpasswd &&  usermod -aG sudo devuser

#switch user
USER devuser
WORKDIR /home/devuser

#Install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /home/devuser/rustup.sh 
RUN chmod +x /home/devuser/rustup.sh
RUN /home/devuser/rustup.sh -y
RUN rm /home/devuser/rustup.sh
RUN . /home/devuser/.cargo/env && rustup toolchain install nightly
RUN . /home/devuser/.cargo/env && rustup default nightly
RUN . /home/devuser/.cargo/env && rustup component add rust-src
RUN . /home/devuser/.cargo/env && rustup +nightly component add rust-analyzer-preview

#setup oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions /home/devuser/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN git clone https://github.com/romkatv/powerlevel10k.git
# run gitstatusd install when docker build rather than postpone to the actuall run time  
RUN /home/devuser/powerlevel10k/gitstatus/install

#add oh-my-zsh config files
ADD --chown=devuser:devuser files/dotzshrc /home/devuser/.zshrc
ADD --chown=devuser:devuser files/dotp10k.zsh /home/devuser/.p10k.zsh
ADD --chown=devuser:devuser files/dotprofile /home/devuser/.profile

#Install vim-plug for neovim
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#add neovim config files
ADD --chown=devuser:devuser files/nvim /home/devuser/.config/nvim
USER root
RUN chown -R devuser:devuser /home/devuser/.config
USER devuser
#run plug install
RUN nvim --headless +silent +PlugInstall +qall
#run treesitter Install
RUN nvim --headless +silent +TSInstall rust c cpp javascript css html +qall

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


USER devuser
ENV TERM xterm-256color
CMD ["zsh"]
