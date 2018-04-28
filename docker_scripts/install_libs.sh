#
# Install common Linux libraries
#
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential libssl-dev libffi-dev
RUN apt-get -y install wget git subversion
RUN apt-get -y install zip unzip
RUN apt-get -y install gfortran
RUN apt-get -y install libopenblas-dev
RUN apt-get -y install openmpi-bin openmpi-common libopenmpi-dev
RUN apt-get -y install enchant
