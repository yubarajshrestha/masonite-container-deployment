# pull official base image
FROM python:3.8.7-buster

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV TZ=UTC

# install dependencies
RUN pip install --upgrade pip
ADD requirements.txt /usr/src/app/
RUN pip install -r requirements.txt

# install system dependencies
RUN apt-get update --fix-missing
RUN apt-get install apt-utils libsm6 libxext6 vim -y


# Add project from current directory to work directory
ADD . /usr/src/app/

COPY .env-docker /usr/src/app/.env
