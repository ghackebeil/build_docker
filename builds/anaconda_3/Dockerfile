FROM continuumio/anaconda3

MAINTAINER Pyomo Developers

#
# Install common Linux libraries
#
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential libssl-dev libffi-dev
RUN apt-get -y install wget git subversion
RUN apt-get -y install gfortran
RUN apt-get -y install libopenblas-dev
RUN apt-get -y install openmpi-bin openmpi-common libopenmpi-dev
RUN apt-get -y install enchant
#
# Install Glpk
#
ARG PREFIX
ARG TARGET
RUN PREFIX=/root
RUN TARGET="glpk-4.65"
RUN echo ${PREFIX}
RUN echo ${TARGET}
RUN cd ${PREFIX} && rm -rf ${TARGET}.tar.gz && cd -
RUN cd ${PREFIX} && wget "https://ftp.gnu.org/gnu/glpk/${TARGET}.tar.gz" && cd -
RUN cd ${PREFIX} && tar xf ${TARGET}.tar.gz && cd -
RUN cd ${PREFIX} && rm -rf ${TARGET}.tar.gz && cd -
RUN mkdir ${PREFIX}/${TARGET}/build
RUN cd ${PREFIX}/${TARGET}/build  && \
    ../configure CXX=g++ CC=gcc F77=gfortran --prefix=${PREFIX}/${TARGET}/build && \
    make -j4 && \
    make install && cd -
ENV PATH="${PREFIX}/${TARGET}/build/bin:${PATH}"
#
# Install Ipopt
#
ARG PREFIX
ARG TARGET
RUN PREFIX=/root
RUN TARGET="Ipopt-3.12.9"
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz && cd -
RUN cd ${PREFIX} && wget "https://www.coin-or.org/download/source/Ipopt/${TARGET}.tgz" && cd -
RUN cd ${PREFIX} && tar xf ${TARGET}.tgz && cd -
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz && cd -
RUN cd ${PREFIX}/${TARGET}/ThirdParty/ASL && ./get.ASL && cd -
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Blas && ./get.Blas && cd -
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Lapack && ./get.Lapack && cd -
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Metis && ./get.Metis && cd -
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Mumps && ./get.Mumps && cd -
RUN mkdir ${PREFIX}/${TARGET}/build
RUN cd ${PREFIX}/${TARGET}/build  && \
    ../configure CXX=g++ CC=gcc F77=gfortran && \
    make -j4 && \
    make install && cd -
ENV PATH="${PREFIX}/${TARGET}/build/bin:${PATH}"
#
# Install CBC
#
ARG PREFIX
ARG TARGET
RUN PREFIX=/root
RUN TARGET="Cbc-2.9.9"
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz && cd -
RUN cd ${PREFIX} && wget "https://www.coin-or.org/download/source/Cbc/${TARGET}.tgz" && cd -
RUN cd ${PREFIX} && tar xf ${TARGET}.tgz && cd -
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz && cd -
RUN cd ${PREFIX}/${TARGET}/ThirdParty/ASL && ./get.ASL && cd -
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Blas && ./get.Blas && cd -
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Glpk && ./get.Glpk && cd -
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Lapack && ./get.Lapack && cd -
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Metis && ./get.Metis && cd -
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Mumps && ./get.Mumps && cd -
RUN mkdir ${PREFIX}/${TARGET}/build
RUN cd ${PREFIX}/${TARGET}/build  && \
    ../configure CXX=g++ CC=gcc F77=gfortran --disable-mysql && \
    make -j4 && \
    make install && cd -
ENV PATH="${PREFIX}/${TARGET}/build/bin:${PATH}"
#
# Install Baron
#
ARG PREFIX
ARG TARGET
RUN PREFIX=/root
RUN TARGET="baron-lin64"
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip && cd -
RUN cd ${PREFIX} && wget "https://www.minlp.com/downloads/xecs/baron/current/${TARGET}.zip" && cd -
RUN cd ${PREFIX} && unzip ${TARGET}.zip && cd -
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip && cd -
ENV PATH="${PREFIX}/${TARGET}:${PATH}"
#
# Install GAMS
#
ARG PREFIX
ARG TARGET
ARG VERSION
ARG GAMSDIR
RUN PREFIX=/root
RUN TARGET="linux_x64_64_sfx.exe"
RUN VERSION="25.0.3"
RUN mkdir ${PREFIX}/GAMS_${VERSION}
RUN cd ${PREFIX}/GAMS_${VERSION} && \
    wget "https://d37drm4t2jghv5.cloudfront.net/distributions/${VERSION}/linux/${TARGET}" && \
    cd -
RUN cd ${PREFIX}/GAMS_${VERSION} && chmod u+x ${TARGET} && cd -
RUN cd ${PREFIX}/GAMS_${VERSION} && ./${TARGET} && cd -
RUN cd ${PREFIX}/GAMS_${VERSION} && rm ${TARGET} && cd -
RUN cd ${PREFIX}/GAMS_${VERSION} && GAMSDIR=`ls` && cd -
RUN GAMSDIR=${PREFIX}/GAMS_${VERSION}/${GAMSDIR}
ENV PATH="${GAMSDIR}:${PATH}"
# TODO: Install GAMS Python API
# python 2.6
#cd ${GAMSDIR}/apifiles/Python/api_26 && python setup.py install && cd -
# python 2.7
#cd ${GAMSDIR}/apifiles/Python/api && python setup.py install && cd -
# python 3.4 / 3.5
#cd ${GAMSDIR}/apifiles/Python/api_34 && python setup.py install && cd -
# python 3.6
#cd ${GAMSDIR}/apifiles/Python/api_36 && python setup.py install && cd -
#
# Install gjh_asl_json
#
ARG PREFIX
ARG TARGET
RUN PREFIX=/root
RUN TARGET="gjh_asl_json-master"
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip && cd -
RUN cd ${PREFIX} && wget "https://codeload.github.com/ghackebeil/gjh_asl_json/zip/master" -O ${TARGET}.zip && cd -
RUN cd ${PREFIX} && unzip ${TARGET}.zip && cd -
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip && cd -
RUN cd ${PREFIX}/${TARGET}/Thirdparty && ./get.ASL && cd -
RUN cd ${PREFIX}/${TARGET} && make && cd -
ENV PATH="${PREFIX}/${TARGET}/bin:${PATH}"
#
# Install common Python libraries
#
RUN pip install -U pip setuptools wheel
RUN pip install cffi
RUN pip install numpy
RUN pip install scipy
RUN pip install mpi4py
RUN pip install cryptography
RUN pip install sympy
RUN pip install networkx
RUN pip install PyYAML
RUN pip install Pyro4
RUN pip install dill
RUN pip install pandas
RUN pip install matplotlib
RUN pip install ipython
RUN pip install openpyxl
RUN pip install pymysql
RUN pip install pyodbc
RUN pip install xlrd
