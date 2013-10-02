FROM ubuntu:12.04
MAINTAINER Evan Hazlett "ejhazlett@gmail.com"
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git-core python-setuptools python-dev libxml2-dev libxslt-dev
RUN easy_install pip
ADD . /opt/app
RUN pip install -r /opt/app/requirements.txt uwsgi

EXPOSE 8000
CMD ["/usr/local/bin/uwsgi", "--ini", "/opt/app/app.ini"]
