#
# Install common Linux libraries
#
RUN echo "" && \
    echo "======================" && \
    echo "INSTALLING COMMON LIBS" && \
    echo "======================" && \
    echo ""
RUN apt-get -q -y update
RUN apt-get -q -y upgrade
RUN apt-get -q -y install build-essential libssl-dev libffi-dev
RUN apt-get -q -y install wget git subversion
RUN apt-get -q -y install zip unzip
RUN apt-get -q -y install gfortran
RUN apt-get -q -y install libopenblas-dev
RUN apt-get -q -y install openmpi-bin openmpi-common libopenmpi-dev
RUN apt-get -q -y install enchant
