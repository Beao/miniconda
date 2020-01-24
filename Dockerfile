FROM gitpod/workspace-full:latest

USER root
# Install util tools.
RUN apt-get update \
 && apt-get install -y \
  apt-utils \
  sudo \
  git \
  less \
  build-essential \
  libfreetype6-dev \
  wget

RUN mkdir -p /workspace/data \
    && chown -R gitpod:gitpod /workspace/data
  
RUN mkdir /home/gitpod/.conda
# Install conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc
    
RUN chown -R gitpod:gitpod /opt/conda \
    && chmod -R 777 /opt/conda \
    && chown -R gitpod:gitpod /home/gitpod/.conda \
    && chmod -R 777 /home/gitpod/.conda

# Install TA-lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
    tar -xvzf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib/ && \
    ./configure — prefix=/usr && \
    make && \
    make install && \
    cd .. && \
    wget https://files.pythonhosted.org/packages/90/05/d4c6a778d7a7de0be366bc4a850b4ffaeac2abad927f95fa8ba6f355a082/TA-Lib-0.4.17.tar.gz && \
    tar xvf TA-Lib-0.4.17.tar.gz && \
    cd TA-Lib-0.4.17 && \
    python setup.py install && \
    cd ..

RUN rm -R ta-lib ta-lib-0.4.0-src.tar.gz TA-Lib-0.4.17 TA-Lib-0.4.17.tar.gz
# Give back control
USER root

# Cleaning
RUN apt-get clean
