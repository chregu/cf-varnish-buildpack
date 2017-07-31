# Just a placeholder

# for PHP 5.3/5.4
#FROM phusion/baseimage:0.9.9

FROM ubuntu:14.04

ENV HOME /root

ADD install_packages.sh /root/
RUN bash /root/install_packages.sh


WORKDIR /root

ADD config.sh /root/

ADD compile_varnish.sh /root/
RUN bash /root/compile_varnish.sh

RUN apt-get install -fy libtool-bin


ADD compile_vmod_statsd.sh /root/
RUN bash /root/compile_vmod_statsd.sh

ADD compile_vmod_basicauth.sh /root/
RUN bash /root/compile_vmod_basicauth.sh

ADD compile_vmod_timers.sh /root/
RUN bash /root/compile_vmod_timers.sh



ADD cleanup.sh /root/
RUN bash /root/cleanup.sh
RUN apt-get install -fy gdb nano

#RUN bash /root/build_varnish_in_docker.sh



