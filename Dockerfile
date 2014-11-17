FROM ubuntu:14.04
MAINTAINER Even Chang

RUN sudo apt-get update
RUN sudo apt-get -y install curl
RUN sudo apt-get -y install python-virtualenv
RUN virtualenv venv
RUN . venv/bin/activate
RUN pip install Flask

RUN mkdir workspace
RUN cd workspace
RUN mkdir getShareCount
RUN cd getShareCount
COPY . /workspace/getShareCount

CMD python /workspace/getShareCount/index.py
