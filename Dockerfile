FROM ubuntu:14.04

RUN echo 'hi'

RUN sudo apt-get -y update
RUN sudo apt-get -y upgrade

RUN sudo apt-get -y install g++
RUN sudo apt-get -y install software-properties-common 
RUN sudo apt-get -y install python
RUN sudo apt-get -y install make
RUN sudo add-apt-repository ppa:chris-lea/node.js
RUN sudo apt-get -y update
RUN sudo apt-get -y install nodejs

RUN sudo apt-get -y install python-virtualenv
RUN sudo apt-get -y install curl
RUN virtualenv venv
RUN . venv/bin/activate
RUN sudo apt-get -y install python-dev
RUN pip install Flask

COPY . /workspace/getShareCount
EXPOSE 5000
CMD ["python", "/workspace/getShareCount/index.py"]
