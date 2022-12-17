# syntax=docker/dockerfile:1
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow

RUN apt-get update && \
    apt-get install tzdata

RUN apt-get update && \
   apt-get install --no-install-recommends -y curl screen python3 build-essential python3-pip
RUN apt-get install ffmpeg libsm6 libxext6  -y && apt clean
RUN pip install --upgrade pip

WORKDIR /laba_4

RUN apt-get install -qy git
RUN git clone https://github.com/ultralytics/yolov5.git
COPY ./yolov5 ./yolov5

WORKDIR /laba_4/yolov5
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
ENTRYPOINT ["python3"]