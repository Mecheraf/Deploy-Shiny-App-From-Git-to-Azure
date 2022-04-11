# Grab the latest image/OS for your container. If you need an older version, check out your needs.
FROM rocker/shiny:latest

## Updates and Upgrades
#RUN apt-get update && \
#    apt-get upgrade -y && \
#    apt-get clean

## Add any R packages here 
#RUN install2.r tidyverse\
#    ## Clean
#    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

#Copy the cloned project
COPY /project/app/ /srv/shiny-server/

# Exposing port to listen on. This was needed when running on an indivdual VM as opposed to an app service plan
# so when the docker starts port 3838 is exposed. 
EXPOSE 3838