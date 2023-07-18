FROM nvidia/cuda:11.2.2-cudnn8-runtime-ubuntu20.04

RUN apt-get update && \
    apt-get -y install curl unzip wget vim iputils-ping

#RUN useradd -ms /bin/bash d2lstudent && \
#    mkdir /d2l && chown d2lstudent /d2l
#
#USER d2lstudent
#SHELL ["/bin/bash", "-c"]
#
WORKDIR /d2l
#RUN mkdir /home/d2lstudent/workspace

RUN curl -s -L https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh -o Miniconda.sh && \
    sh Miniconda.sh -b -p /d2l/miniconda3 && \
    rm Miniconda.sh

RUN /d2l/miniconda3/bin/conda create --name d2l python=3.9 -y && \
    /d2l/miniconda3/bin/conda install pip && \
    /d2l/miniconda3/bin/conda run -n d2l pip install torch==1.12.0 && \
    /d2l/miniconda3/bin/conda run -n d2l pip install torchvision==0.13.0 && \
    /d2l/miniconda3/bin/conda run -n d2l pip install jupyter && \
    /d2l/miniconda3/bin/conda run -n d2l pip install d2l==0.17.6 && \
    /d2l/miniconda3/bin/conda run -n d2l pip install jupyterlab

RUN mkdir d2l-zh && cd d2l-zh && \
    curl https://zh-v2.d2l.ai/d2l-zh-2.0.0.zip -o d2l-zh.zip && \
    unzip d2l-zh.zip && rm d2l-zh.zip 

ENV PATH=/d2l/miniconda3/bin:$PATH

CMD conda run --no-capture-output -n d2l jupyter lab --notebook-dir=/d2l/d2l-zh/pytorch --allow-root --ip=0.0.0.0
