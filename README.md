# debian-base

*EarthWalkSoftware/debian-base* is a version of the *nimmis/docker-ubuntu* docker image modified for use with *Debian 9*.  It adds several system utilities and libraries that are nominally required to properly utilize the *library/debian:9.2* docker image, and adds system initialization and supervisor functions for better control.  

A docker image of *earthwalksoftware/debian-base* is available from *EarthWalkSoftware* at *Docker Hub*:

  https://hub.docker.com/r/earthwalksoftware/debian-base/

______
### Packages
Among the additional packages are 
- *apt*
- *apt-transport-https*  
- *cron* 
- *curl*
- *git*
- *less*
- *libcurl3-gnutls*
- *locales*
- *logrotate* 
- *nano* 
- *patch* 
- *psmisc*
- *software-properties-common*
- *sudo* 
- *supervisor*
- *syslog-ng* 
- *syslog-ng-core* 
- *unzip* 
- *wget* 
- *zip*

______
### Documentation
Documentation for this docker image is provided by the original *nimmis/docker-ubuntu* docker image documentation at  

  https://github.com/nimmis/docker-ubuntu

When following the narrative, replace *nimmis/docker-ubuntu* with *earthwalksoftware/debian-base*, and *ubuntu* with *debian*.  The provided functions and utilities are identical to the original image, except that they are being run under *Debian 9.2*.

______
### Creating a container
The following command will create a docker container named *base* and start a console version of *bash*:

    docker run -it \
               --rm \
               --name=base \
           earthwalksoftware/debian-base:1.0.0  
______
## Simple tests

#### Test 1
Copy the docker command above (*Creating a container*) and paste it into a docker host command line to create a temporary docker container named *base*.  The docker container will display it's startup status, something like this:

    docker run -it --rm --name=base debian-base:1.0.0  
    *** open logfile  
    *** Run files in /etc/my_runonce/  
    *** Run files in /etc/my_runalways/  
    *** Booting supervisor daemon...  
    *** Supervisor started as PID 6  
    2017-12-27 01:33:15,975 CRIT Set uid to user 0  
    *** Started processes via Supervisor......  
    crond                            RUNNING   pid 10, uptime 0:00:03  
    syslog-ng                        RUNNING   pid 9, uptime 0:00:03  

Press the Ctrl/C combination and the container should exit, something similar to  

    *** Shutting down supervisor daemon (PID 6)...  
    sh: 1: ps: not found  
    *** Killing all processes...  

______
### locale
The following locale is automatically created in the image:

    locale-gen en_US
    update-locale LANG=C.UTF-8 LC_MESSAGES=POSIX  
  
This setting may be changed in the Dockerfile (using the RUN command) when building a new container from the *earthwalksoftware/debian-base* image, 

------
### Licensed by Academic Free License v 3.0

Read the license at https://github.com/EarthWalkSoftware/docker-alpine-htop/wiki/License

Any conflict between the terms of the *Academic Free License v 3.0* and the terms of any license provided by *nimmis/docker-ubuntu*, the terms of the *nimmis/docker-ubuntu* license shall prevail.
____

*2017-12-26. Jay Wheeler @ EarthWalkSoftware*
