#
# Install common Linux libraries
#
RUN echo "" && \
    echo "======================" && \
    echo "INSTALLING COMMON LIBS" && \
    echo "======================" && \
    echo ""
RUN apt-get -q update && \
    apt-get -q -y --no-install-recommends install \
        build-essential libssl-dev libffi-dev \
        wget zip unzip \
        git subversion \
        gfortran \
        libopenblas-dev \
        openmpi-bin openmpi-common libopenmpi-dev \
        enchant \
        unixodbc unixodbc-dev && \
    rm -rf /var/lib/apt/lists/*
