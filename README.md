# debian-base

*EarthWalkSoftware/debian-base* is a modified version of the *nimmis/ubuntu* docker image for use with Debian 9.  It adds several system utilities and libraries that are nominally required to properly utilize the *library/debian:9.2* docker image, and adds system initialization and supervisor functions for better control.  

Among the additional packages are 
- *software-properties-common*
- *locales*
- *wget* 
- *curl*
- *zip*
- *unzip* 
- *patch* 
- *less*
- *git*
- *nano* 
- *psmisc*
- *syslog-ng* 
- *syslog-ng-core* 
- *cron* 
- *logrotate* 
- *sudo* 
- *libcurl3-gnutls*
- *apt-transport-https*  

An explanation about the use and features provided by this docker image, refer to the documation for the *nimmis/ubuntu* docker image at  

  https://github.com/nimmis/docker-ubuntu

When following the directions, replace *nimmis/ubuntu* with *EarthWalkSoftware/debian:9.2*, and *ubuntu* with *debian*.  The provided functions and utilities are identical to the original image, except they are being run under *Debian 9.2*.

------
### locale
The following locale is automatically created in the image:

    locale-gen en_US
    update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX  
  
This setting may be changed in the Dockerfile (using the RUN command) when building a new container from the *EarthWalkSoftware/debian-base* image, 

------



