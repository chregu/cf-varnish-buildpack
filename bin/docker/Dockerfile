# Just a placeholder

# for PHP 5.3/5.4
#FROM phusion/baseimage:0.9.9

FROM ubuntu:10.04

ENV HOME /root

ADD install_packages.sh /root/
RUN bash /root/install_packages.sh


WORKDIR /root

ADD config.sh /root/

ADD compile_pcre.sh /root/
RUN bash /root/compile_pcre.sh

ADD compile_varnish.sh /root/
RUN bash /root/compile_varnish.sh


ADD cleanup.sh /root/
RUN bash /root/cleanup.sh


#RUN bash /root/build_varnish_in_docker.sh



