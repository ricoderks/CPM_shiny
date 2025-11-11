FROM rocker/shiny:latest
LABEL maintainer="<Rico Derks r.j.e.derks@lumc.nl">

## install some packages I need (e.g. from bioconductor)
## not yet the same approach as above (i.e. install SUGGETS list manually)
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    git \
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
    htmlTable \
    rsm \
    pls \
    plotly \
    VennDiagram \
    sessioninfo \
    openxlsx \
    tidyxl \
    ggvis \
    unpivotr \
    BiocManager

RUN R -e 'BiocManager::install(c("multtest", "pcaMethods", "preprocessCore", "xcms", "Biobase", "mzID"))' \
  && R -e 'devtools::install_github("ricoderks/Rcpm")' \
  && R -e 'devtools::install_github("ricoderks/ggCPM")' \
  && R -e 'devtools::install_github("ricoderks/cReateSeq")' \
  && R -e 'devtools::install_github("ricoderks/QComics")' \
  && R -e 'devtools::install_github("ricoderks/QClipidyzeR")' \
  && R -e 'devtools::install_github("ricoderks/lipidomics")'
  
RUN rm -rf /tmp/downloaded_packages/ /tmp/*.rds
