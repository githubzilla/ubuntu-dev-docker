ARG BASE_IMAGE=xj4reg/postgresql-dev:latest
#ARG BASE_IMAGE=registry-vpc.cn-hongkong.aliyuncs.com/xj4reg/postgresql-dev:latest
FROM ${BASE_IMAGE}

ARG USER=devuser

#install bear
RUN apt-get install -y bear
RUN apt-get install -y python3-pip
RUN pip install compdb

#get source
WORKDIR /home/${USER}
ADD --chown=${USER}:${USER} files/REL2_4_0.zip /home/${USER}/
RUN mv /home/${USER}/pglogical-REL2_4_0 /home/${USER}/pglogical

#make
WORKDIR /home/${USER}/pglogical
RUN bear -- make
RUN compdb -p ./ list > compile_commands.compdb.json
RUN mv compile_commands.compdb.json compile_commands.json
RUN . /home/${USER}/.profile && make install
RUN make clean

RUN chown -R ${USER}:${USER} /home/${USER}/pglogical

USER ${USER}

WORKDIR /home/${USER}
ENV TERM xterm-256color
CMD ["zsh"]
