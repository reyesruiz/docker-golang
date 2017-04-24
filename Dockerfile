FROM centos:7

MAINTAINER Reyes Ruiz <reyes_ruiz@digitalruiz.com>

ENV container docker
ENV GOROOT=/usr/local/go
ENV PATH=$PATH:$GOROOT/bin

WORKDIR /tmp
RUN yum clean all && \ 
	yum update -y && \
	yum install vim wget git -y && \
	yum clean all && yum update -y
RUN wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz && \
	tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz && \
	mkdir /opt/go && \
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
	git clone https://github.com/fatih/vim-go.git ~/.vim/plugged/vim-go && \
	echo "call plug#begin()" >> ~/.vimrc ; echo "Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }" >> ~/.vimrc ; echo "call plug#end()" >> ~/.vimrc

RUN rm -rf /tmp/*
WORKDIR /opt/go
ENTRYPOINT ["/bin/bash"]
