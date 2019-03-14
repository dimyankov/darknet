ARG CUDA_VERSION=10.0
ARG UBUNTU_VERSION=18.04

FROM nvidia/cuda:$CUDA_VERSION-cudnn7-devel-ubuntu$UBUNTU_VERSION

RUN \
     apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
         libopencv-dev \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

RUN mkdir /work

COPY . /work

WORKDIR /work

RUN make darknet-cpp-shared \
    && cp libdarknet-cpp-shared.so ../ \
