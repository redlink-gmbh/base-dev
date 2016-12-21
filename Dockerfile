# Dockerfile for a the libs-CI

FROM debian:stretch
MAINTAINER sergio.fernandez@redlink.co

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq \
    && apt-get install -y locales -qq \
    && locale-gen en_US.UTF-8 en_us \
    && dpkg-reconfigure locales \
    && locale-gen C.UTF-8 \
    && /usr/sbin/update-locale LANG=C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update -qq \
    && apt-get install -y \
       git \
       wget \
       unzip \
       zip \
       libreoffice \
       tesseract-ocr \
       tesseract-ocr-osd \
       tesseract-ocr-deu \
       ghostscript \
       imagemagick \
       openjdk-8-jdk \
       maven

RUN apt-get clean -y  \
    && apt-get autoclean -y  \
    && apt-get autoremove -y  \
    && rm -rf /var/lib/apt/lists/*
