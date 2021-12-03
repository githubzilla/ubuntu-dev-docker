FROM ubuntu:latest
LABEL maintainer="githubzilla"

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
RUN apt-get install -y build-essential
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update
RUN apt-get install neovim
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 

#add developer user account
RUN adduser --quiet --disabled-password --shell /bin/zsh --home /home/devuser --gecos "User" devuser && \
    echo "devuser:p@ssword1" | chpasswd &&  usermod -aG sudo devuser

#switch user
USER devuser
WORKDIR /home/devuser

#setup oh-my-zsh
ENV REMOTE=https://www.github.com/ohmyzsh/ohmyzsh.git
RUN wget https://www.github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
RUN git clone https://github.com/zsh-users/zsh-autosuggestions /home/devuser/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN git clone https://www.github.com/romkatv/powerlevel10k.git
# run gitstatusd install when docker build rather than postpone to the actuall run time  
RUN /home/devuser/powerlevel10k/gitstatus/install

#add config files
ADD files/dotzshrc /home/devuser/.zshrc
ADD files/dotp10k.zsh /home/devuser/.p10k.zsh
ADD files/dotprofile /home/devuser/.profile
ENV TERM xterm-256color
CMD ["zsh"]




