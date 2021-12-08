FROM ubuntu:focal

# Installing make, git, python3 and setting it as the default python
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends wget git make && \
    apt-get install -y --no-install-recommends python3 python3-pip && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 1 && \
    apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Installing Arm GCC
WORKDIR /opt/
RUN cd /opt/ && \
    wget -q https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 && \
    echo "8312c4c91799885f222f663fc81f9a31  gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2" >> MD5SUM && \
    md5sum -c MD5SUM && \
    rm MD5SUM && \
    tar -xf gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 && \
    rm gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
ENV PATH $PATH:/opt/gcc-arm-none-eabi-10-2020-q4-major/bin

# Installing DAPLink Python dependencies, CMake, and Ninja
COPY requirements.txt /home/
RUN python3 -m pip --no-cache-dir install -r /home/requirements.txt && \
    python3 -m pip --no-cache-dir install cmake==3.22.0 ninja==1.10.2.3  && \
    rm /home/requirements.txt

WORKDIR /home/
