FROM ubuntu:latest
LABEL org.opencontainers.image.source="https://github.com/philsupertramp/tex-starter"
LABEL org.opencontainers.image.authors="philsupertramp@godesteem.de"

RUN apt-get update && apt-get upgrade -y
RUN DEBIAN_FRONTEND="nointeraction" apt-get -y install texlive-latex-extra texlive-science texlive-fonts-extra \
  texlive-xetex texlive-plain-generic \
  texlive-font-utils texlive-lang-german

RUN mkdir -p /usr/app

WORKDIR /usr/app

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT [ "bash", "/usr/app/entrypoint.sh" ]

