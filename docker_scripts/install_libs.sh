#
# Install common Linux libraries
#
RUN echo "" && \
    echo "======================" && \
    echo "INSTALLING COMMON LIBS" && \
    echo "======================" && \
    echo ""
RUN apt-get -qq update
RUN apt-get -qq upgrade
RUN apt-get -qq install build-essential libssl-dev libffi-dev
RUN apt-get -qq install wget git subversion
RUN apt-get -qq install zip unzip
RUN apt-get -qq install gfortran
RUN apt-get -qq install libopenblas-dev
RUN apt-get -qq install openmpi-bin openmpi-common libopenmpi-dev
RUN apt-get -qq install enchant
RUN apt-get -qq install unixodbc unixodbc-dev
