FROM rocker/shiny:latest
LABEL maintainer "Rico Derks" r.j.e.derks@lumc.nl

## install some packages I need (e.g. from bioconductor)
## not yet the same approach as above (i.e. install SUGGETS list manually)
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    subversion \
    netcdf-bin \
    libnetcdf-dev \
    libxml2-dev \
    libssl-dev \
  && . /etc/environment

RUN install2.r --error --skipinstalled \
    DT \
    tidyverse \
    stringi \
    devtools \
    openssl \
    httr \
    estimability \
    XML \
    Biobase \
    mzID \
    multtest \
    xcms \
    htmlTable \
    CAMERA \
    rsm \
    pcaMethods \
    pls \
    preprocessCore \
    plotly \
    VennDiagram \
    sessioninfo \
    stringi \
    openxlsx \
    tidyxl \
    ggvis \
    unpivotr

RUN R -e 'BiocManager::install(c("multtest", "CAMERA", "pcaMethods", "preprocessCore"))' \
  && R -e 'devtools::install_github("ricoderks/Rcpm")' \
  && R -e 'devtools::install_github("ricoderks/ggCPM")'
  
RUN rm -rf /tmp/downloaded_packages/ /tmp/*.rds
