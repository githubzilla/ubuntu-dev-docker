FROM xj4reg/ubuntu-dev:latest

ARG USER=devuser

USER root
#install dependences
RUN sudo apt-get install -y libreadline-dev zlib1g-dev flex bison libxml2-dev libxslt-dev libssl-dev libxml2-utils xsltproc

#get source
WORKDIR /home/${USER}
ADD --chown=${USER}:${USER} files/postgresql-13.5.tar.gz /home/${USER}/
RUN mv /home/${USER}/postgresql-13.5 /home/${USER}/postgresql

#install bear
RUN apt-get install -y bear
RUN apt-get install -y python3-pip
RUN pip install compdb

#make
WORKDIR /home/${USER}/postgresql
RUN ./configure
RUN bear -- make world
RUN make install-world
RUN compdb -p ./ list > compile_commands.compdb.json
RUN mv compile_commands.compdb.json compile_commands.json

#update profile
ADD --chown=${USER}:${USER} files/dotprofile.postgresql /home/${USER}/.profile

#clean up
#RUN rm -rf /home/${USER}/postgresql-13.5.tar
RUN chown ${USER}:${USER} /home/${USER}/postgresql

#create database
USER ${USER}
RUN mkdir /home/${USER}/pgdata
RUN . /home/${USER}/.profile && initdb -D /home/${USER}/pgdata --username ${USER}

#add postgresql script
ADD --chown=${USER}:${USER} --chmod=777 files/startdb.sh /home/${USER}/startdb.sh
ADD --chown=${USER}:${USER} --chmod=777 files/stopdb.sh /home/${USER}/stopdb.sh
ADD --chown=${USER}:${USER} --chmod=777 files/psql.sh /home/${USER}/psql.sh
ADD --chown=${USER}:${USER} files/clangd /home/${USER}/.config/clangd

WORKDIR /home/${USER}
ENV TERM xterm-256color
CMD ["zsh"]
