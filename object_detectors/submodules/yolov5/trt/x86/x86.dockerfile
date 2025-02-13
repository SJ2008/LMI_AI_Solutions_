FROM nvcr.io/nvidia/pytorch:22.09-py3
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

WORKDIR /repos
RUN pip install --upgrade pip
RUN git clone https://github.com/lmitechnologies/LMI_AI_Solutions.git && cd LMI_AI_Solutions && git submodule update --init object_detectors/yolov5
RUN pip install -r /repos/LMI_AI_Solutions/object_detectors/yolov5/requirements.txt
RUN pip install opencv-python==4.5.5.64
