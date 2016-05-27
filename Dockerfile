FROM cclausen/rock-base:latest


#####################################
# Change user and manage git config #
#####################################

RUN rm /opt/rock/autoproj/config.yml
USER rocker
RUN git config --global user.name "Punk Rocker"
RUN git config --global user.email "rocker@example.com"
WORKDIR /opt/rock/


#####################################
# Apply changes by copying files    #
#####################################
COPY manifest /opt/rock/autoproj/manifest
COPY expect_autoproj.exp /opt/rock/expect_autoproj.exp
COPY autoproj_config.yml /opt/rock/autoproj/config.yml
USER root
RUN chown rocker:rocker /opt/rock/autoproj/manifest /opt/rock/expect_autoproj.exp /opt/rock/autoproj/config.yml
USER rocker


####################################
# Build new stuff                  #
####################################

#RUN . /opt/rock/env.sh && expect expect_autoproj.exp # Needs to be done manually, as this needs VPN
#RUN . /opt/rock/env.sh && autoproj build
#To use your own connections (like VPN) use docker run -ti --net=host cclausen/rock_core:latest
