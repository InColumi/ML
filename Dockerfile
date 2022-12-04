# syntax=docker/dockerfile:1
# FROM ubuntu:latest
# RUN apt-get update -qy
# RUN apt-get install -qy python3 python3-pip
# RUN pip install --upgrade pip
# RUN apt-get install -qy git
# WORKDIR /home/laba_4
# COPY ./yolov5 ./yolov5
# COPY ./env ./env
# # RUN git clone https://github.com/ultralytics/yolov5.git
# # RUN source env/Scripts/activate
# WORKDIR /home/laba_4/yolov5
# # RUN pip install -r requirements.txt
# COPY ./path.py .
# ENTRYPOINT ["python3"]
# RUN pip install --no-cache-dir -r requirements.txt

FROM python:3
RUN pip install --upgrade pip
RUN apt-get update -qy
WORKDIR /laba_4

RUN git clone https://github.com/ultralytics/yolov5.git
COPY ./yolov5 ./yolov5

WORKDIR /laba_4/yolov5
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
