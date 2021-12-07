FROM xj4reg/ubuntu-dev:latest

USER root
#install dependences
RUN sudo apt-get install -y libreadline-dev zlib1g-dev flex bison libxml2-dev libxslt-dev libssl-dev libxml2-utils xsltproc

#get source
WORKDIR /home/devuser
RUN wget https://ftp.postgresql.org/pub/source/v13.5/postgresql-13.5.tar.gz
RUN gunzip postgresql-13.5.tar.gz
RUN tar xf postgresql-13.5.tar

#make
WORKDIR /home/devuser/postgresql-13.5
RUN ./configure
RUN make world
RUN make install-world

#update profile
ADD --chown=devuser:devuser files/dotprofile.postgresql /home/devuser/.profile


