#image going to inherit from
# build images ontop of other images
# add customized bit for your project
# hub.docker.com
# alpine - docker - runs python 3.7 #lightweight image that runs python

# python version and tag line
FROM python:3.7-alpine
MAINTAINER arfasaif


#python buffer environment variable
# python run in unbuffered mode - so output is not unbuffered

ENV PYTHONUNBUFFERED 1

# store all the requirements
#django rest Framework

# from python package manager
# rebuild docker with the latest
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# create directory in docker for application soruce code

RUN mkdir /app
WORKDIR /app
# empty folder then default directory starting from this location
# any application run will use this as the default directory
COPY ./app /app


# create user who will run this application
# -D is for a user who can only run applications, not for a home directory to log into
# just runs the processes
RUN adduser -D user
USER user
#otherwise the application will be run as root access, and have root access to the images
# limits the person have inside the docker container
# docker compose is a tool to run our docker image easily from our project location
# manage services for our applications, like python applicationnd database
