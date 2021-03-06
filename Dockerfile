# =========================================================================
# =========================================================================
#
#	Dockerfile
#	  Dockerfile for debian-base (docker utilities base) 
#		in a Debian 9.3 (Stretch) docker container.
#
# =========================================================================
#
# @author Jay Wheeler.
# @version 2.0.0
# @copyright © 2017. EarthWalk Software.
# @license Licensed under the Academic Free License version 3.0
# @package debian-base
# @subpackage Dockerfile
#
# =========================================================================
#
#	Copyright © 2017. EarthWalk Software
#	Licensed under the Academic Free License, version 3.0.
#
#	Refer to the file named License.txt provided with the source,
#	or from
#
#		http://opensource.org/licenses/academic.php
#
# =========================================================================
# =========================================================================
#
#    Modified nimmis/ubuntu
#       earthwalksoftware/ubuntu-base - to support 17.04 and 17.10,
#       earthwalksoftware/debian-base - to Debian 9.x.
#
# =========================================================================
# =========================================================================
FROM debian:9.3

MAINTAINER Jay Wheeler <EarthWalkSoftware@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg-divert --local --rename --add /sbin/initctl \
 && ln -sf /bin/true /sbin/initctl \
 && echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list \
 && apt-get -y update \
 && apt-get -y upgrade \ 
 && apt-get -y install \
       apt \
       apt-transport-https \
       cron \
       curl \
       git \
       less \
       libcurl3-gnutls \
       locales \
       logrotate \
       nano \
       patch \
       procps \
       psmisc \
       software-properties-common \
       sudo \
       supervisor \
       syslog-ng \
       syslog-ng-core \
       unzip \
       wget \
       zip \
 && apt-get -y dist-upgrade \
 && apt-get clean all \
 && locale-gen en_US \
 && update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX \
 && sed -i -E 's/^(\s*)system\(\);/\1unix-stream("\/dev\/log");/' /etc/syslog-ng/syslog-ng.conf 

COPY scripts/. /

ENV HOME /root
WORKDIR /root

VOLUME /var/log

ENTRYPOINT ["/my_init"]
CMD ["/bin/bash"]
