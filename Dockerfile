FROM centos:7

MAINTAINER Reyes Ruiz <reyes_ruiz@digitalruiz.com>

ENV container docker

WORKDIR /tmp
RUN yum clean all && yum update -y
RUN yum install vim wget git -y
RUN yum clean all && yum update -y
RUN wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz 
RUN tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz
RUN export PATH=$PATH:/usr/local/go/bin ; export GOPATH=/usr/local/go
RUN echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile ; \
	echo "export GOPATH=/usr/local/go" >> /etc/profile
RUN mkdir /opt/go
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN git clone https://github.com/fatih/vim-go.git ~/.vim/plugged/vim-go
RUN  echo "call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()" >> ~/.vimrc


WORKDIR /opt/go

WORKDIR /tmp
RUN rm -rf *
