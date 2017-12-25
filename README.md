# debian-base

*EarthWalkSoftware/debian-base* is a docker image that adds several system utilities and libraries that are nominally required to properly utilize the *library/debian:9.2* docker image.  Among the additional packages are 
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

The addition of these packages increase the size of the base image from *100 MB* to about *280 MB*.

------
### locale
The following locale is automatically created in the image:

    locale-gen en_US
    update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX  
  
This setting may be changed in the Dockerfile (using the RUN command) when building a new container from the *EarthWalkSoftware/debian-base* image, 

------
### About the syslog


