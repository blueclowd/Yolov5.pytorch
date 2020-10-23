FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

RUN apt-get update
RUN apt-get install -y python3.6
RUN apt-get install -y python3-pip
RUN ln -s /usr/bin/python3.6 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN apt-get install -y libsm6 libxext6 libxrender-dev

RUN pip install opencv-python==3.4.3.18 tensorboard matplotlib PyYAML scipy tqdm

# Pytorch cuda 10.1
RUN pip install torch==1.5.0+cu101 torchvision==0.6.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html torchsummary

RUN groupadd -g 1008 vincent && \
    useradd -m -r -u 1007 -g vincent vincent

# USER vincent
WORKDIR /home/vincent/code
VOLUME /home/vincent/code