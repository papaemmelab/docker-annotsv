FROM ubuntu:focal

LABEL version="3.4.4" description="AnnotSV with dependencies"

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
        wget \
        git \
        make \
        gcc \
        zlib1g-dev \
        liblzma-dev \
        libbz2-dev \
        libcurl4-gnutls-dev \
        tcl \
        pigz

ENV BEDTOOLS_INSTALL_DIR=/opt/bedtools2
ENV BEDTOOLS_VERSION=2.31.0
RUN mkdir $BEDTOOLS_INSTALL_DIR

WORKDIR /opt/bedtools2
RUN wget https://github.com/arq5x/bedtools2/releases/download/v$BEDTOOLS_VERSION/bedtools.static && \
    mv bedtools.static bedtools && \
    chmod a+x bedtools && \
    ln -s $BEDTOOLS_INSTALL_DIR/bedtools /usr/bin

ENV SAMTOOLS_VERSION=1.21
WORKDIR /opt
RUN git clone --branch $SAMTOOLS_VERSION --recurse-submodules https://github.com/samtools/htslib.git && \
    git clone --branch $SAMTOOLS_VERSION https://github.com/samtools/bcftools.git

WORKDIR /opt/bcftools
RUN make && ln -s /opt/bcftools/bcftools /usr/bin

ENV ANNOTSV_INSTALL_DIR=/opt/AnnotSV
ENV ANNOTSV_VERSION=3.4.4
WORKDIR /opt
RUN git clone --branch v$ANNOTSV_VERSION https://github.com/lgmgeo/AnnotSV.git

WORKDIR /opt/AnnotSV
RUN make PREFIX=. install

ENV ANNOTSV=/opt/AnnotSV
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/AnnotSV/bin/
RUN apt remove -y git wget

WORKDIR /

CMD ["/bin/bash"]

