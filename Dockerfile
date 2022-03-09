# Grab the latest image/OS for your container. If you need an older version, check out your needs.
FROM rocker/shiny:latest

## Updates and Upgrades
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean

# Install Git 
RUN apt-get install -y git

# Create a folder and clone your poject in this folder. Change the information in the Link to fit your informations.
# I didn't try it with something else than Github but as long as you can clone a repo, it works.
RUN mkdir /home/shinyR/
RUN git clone https://<USER>:<PersonalAccessToken>@github.com/<RepoLink> /home/shinyR/
#Example : https://Mecheraf:Token123456@github.com/Mecheraf/Deploy-Shiny-App-From-Git-To-Azure

## Add any R packages here 
RUN install2.r tidyverse\
    ## Clean
    && rm -rf /tmp/downloaded_packages/ /tmp/*.rds

# Copy files from the Git downloaded folder into the docker image file location /srv/shiny-server/ 
# This command will look for a app/ folder in your repo. If your architecture differs, change the path below.
RUN cp /home/shinyR/app/* /srv/shiny-server/

# Exposing port to listen on. This was needed when running on an indivdual VM as opposed to an app service plan
# so when the docker starts port 3838 is exposed. 
EXPOSE 3838
