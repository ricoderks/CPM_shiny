FROM rocker/shiny:latest
LABEL maintainer="<Rico Derks r.j.e.derks@lumc.nl">

# install some system requirements
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    git \
    subversion \
    netcdf-bin \
    libnetcdf-dev \
    libxml2-dev \
    libssl-dev \
    libwebpmux3 \
  && . /etc/environment

# CRAN packages
RUN install2.r --error --skipinstalled \
    BiocManager \
    devtools \
    DT \
    estimability \
    ggvis \
    hablar \
    htmlTable \
    httr \
    leaflet \
    openssl \
    openxlsx \
    phonTools \
    plotly \
    pls \
    readr \
    readxl \
    rsm \
    sessioninfo \
    shinydashboard \
    shinyWidgets \
    stringi \
    stringr \
    tidyverse \
    tidyxl \
    unpivotr \
    VennDiagram \
    writexl \
    XML

# BiocManager and github packages
RUN R -e 'BiocManager::install(c("Biobase", "multtest", "mzID", "pcaMethods", "preprocessCore", "rhdf5", "xcms"))' \
  && R -e 'devtools::install_github("ricoderks/BatchCorrection")' \
  && R -e 'devtools::install_github("ricoderks/cReateSeq")' \
  && R -e 'devtools::install_github("ricoderks/ggCPM")' \
  && R -e 'devtools::install_github("ricoderks/lipidomics")' \
  && R -e 'devtools::install_github("ricoderks/QClipidyzeR")' \
  && R -e 'devtools::install_github("ricoderks/QComics")' \
  && R -e 'devtools::install_github("ricoderks/Rcpm")'

# remove downloaded packages
RUN rm -rf /tmp/downloaded_packages/ /tmp/*.rds
