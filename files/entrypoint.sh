#!/usr/bin/bash
# Run commands in the Docker container with a particular UID and GID.
# The idea is to run the container like
#   docker run -i \
#     -e USER=`id -u $USER` \
#     -e GROUP=`id -g $USER` \
#     image-name /bin/zsh
# where the -e flags pass the env vars to the container, which are read by this script.
# By setting copying this script to the container and setting it to the

# ENTRYPOINT, and subsequent commands run in the container will run as the user
# who ran `docker` on the host, and so any output files will have the correct
# permissions.

# USER and GROUP to run
USER=${USER:-devuser}
GROUP=${GROUP:-$USER}
PASSWD=${PASSWD:-passwd01}

export HOME=/home/$USER

# add new user if $USER not exists
if [ "$USER" != "root" ]; then
    echo User $USER is not found, create it
    addgroup --gid 1000 $GROUP \
    && adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER --gecos "User" --uid 1000 --gid 1000 $USER \
    && echo "$USER:$PASSWD" | chpasswd \
    && usermod -aG sudo $USER

    # copy user configuration files
    cp -r /root/.local /root/.zshrc /root/.profile /root/.oh-my-zsh /root/.cargo /root/.rustup /root/.config /root/.p10k.zsh /root/.zshenv /root/powerlevel10k /home/$USER
    # add vim-plug
    mkdir -p /home/${USER}/.local/share/nvim/site/autoload
    cp /root/.local/share/nvim/site/autoload/plug.vim /home/${USER}/.local/share/nvim/site/autoload/plug.vim
    chown -R $USER:$USER $HOME
fi

exec /usr/sbin/gosu $USER:$GROUP "$@"
