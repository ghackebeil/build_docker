FROM pypy:2

MAINTAINER Pyomo Developers

RUN ln -s "$(which pypy)" /usr/local/bin/python
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
#
# Install GAMS
#
RUN echo "" && \
    echo "===============" && \
    echo "INSTALLING GAMS" && \
    echo "===============" && \
    echo ""
ARG PREFIX="/root"
ARG TARGET="linux_x64_64_sfx.exe"
ARG VERSION="25.0.3"
RUN mkdir ${PREFIX}/GAMS_${VERSION}
RUN cd ${PREFIX}/GAMS_${VERSION} && \
    wget -q "https://d37drm4t2jghv5.cloudfront.net/distributions/${VERSION}/linux/${TARGET}"
RUN cd ${PREFIX}/GAMS_${VERSION} && chmod u+x ${TARGET}
RUN cd ${PREFIX}/GAMS_${VERSION} && ./${TARGET} > /dev/null
RUN cd ${PREFIX}/GAMS_${VERSION} && rm ${TARGET}
ARG GAMSDIR="`ls ${PREFIX}/GAMS_${VERSION}`"
ENV PATH="${GAMSDIR}:${PATH}"
# TODO: Install GAMS Python API
# python 2.6
#cd ${GAMSDIR}/apifiles/Python/api_26 && python setup.py install
# python 2.7
#cd ${GAMSDIR}/apifiles/Python/api && python setup.py install
# python 3.4 / 3.5
#cd ${GAMSDIR}/apifiles/Python/api_34 && python setup.py install
# python 3.6
#cd ${GAMSDIR}/apifiles/Python/api_36 && python setup.py install
#
# Install Baron
#
RUN echo "" && \
    echo "================" && \
    echo "INSTALLING BARON" && \
    echo "================" && \
    echo ""
ARG PREFIX="/root"
ARG TARGET="baron-lin64"
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip
RUN cd ${PREFIX} && wget -q "https://www.minlp.com/downloads/xecs/baron/current/${TARGET}.zip"
RUN cd ${PREFIX} && unzip -q ${TARGET}.zip
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip
ENV PATH="${PREFIX}/${TARGET}:${PATH}"
#
# Install gjh_asl_json
#
RUN echo "" && \
    echo "=======================" && \
    echo "INSTALLING GJH_ASL_JSON" && \
    echo "=======================" && \
    echo ""
ARG PREFIX="/root"
ARG TARGET="gjh_asl_json-master"
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip
RUN cd ${PREFIX} && wget -q "https://codeload.github.com/ghackebeil/gjh_asl_json/zip/master" -O ${TARGET}.zip
RUN cd ${PREFIX} && unzip -q ${TARGET}.zip
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip
RUN cd ${PREFIX}/${TARGET}/Thirdparty && ./get.ASL 2> /dev/null
RUN cd ${PREFIX}/${TARGET} && make > /dev/null
ENV PATH="${PREFIX}/${TARGET}/bin:${PATH}"
#
# Install Glpk
#
RUN echo "" && \
    echo "===============" && \
    echo "INSTALLING GLPK" && \
    echo "===============" && \
    echo ""
ARG PREFIX="/root"
ARG TARGET="glpk-4.65"
RUN cd ${PREFIX} && rm -rf ${TARGET}.tar.gz
RUN cd ${PREFIX} && wget -q "https://ftp.gnu.org/gnu/glpk/${TARGET}.tar.gz"
RUN cd ${PREFIX} && tar xf ${TARGET}.tar.gz
RUN cd ${PREFIX} && rm -rf ${TARGET}.tar.gz
RUN mkdir ${PREFIX}/${TARGET}/build
RUN cd ${PREFIX}/${TARGET}/build  && \
    ../configure CXX=g++ CC=gcc F77=gfortran --prefix=${PREFIX}/${TARGET}/build > /dev/null && \
    make -j4 > /dev/null && \
    make install > /dev/null
ENV PATH="${PREFIX}/${TARGET}/build/bin:${PATH}"
#
# Install Ipopt
#
RUN echo "" && \
    echo "================" && \
    echo "INSTALLING IPOPT" && \
    echo "================" && \
    echo ""
ARG PREFIX="/root"
ARG TARGET="Ipopt-3.12.9"
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz
RUN cd ${PREFIX} && wget -q "https://www.coin-or.org/download/source/Ipopt/${TARGET}.tgz"
RUN cd ${PREFIX} && tar xf ${TARGET}.tgz
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz
RUN cd ${PREFIX}/${TARGET}/ThirdParty/ASL && ./get.ASL 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Blas && ./get.Blas 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Lapack && ./get.Lapack 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Metis && ./get.Metis 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Mumps && ./get.Mumps 2> /dev/null
RUN mkdir ${PREFIX}/${TARGET}/build
RUN cd ${PREFIX}/${TARGET}/build  && \
    ../configure CXX=g++ CC=gcc F77=gfortran > /dev/null && \
    make -j4 > /dev/null && \
    make install > /dev/null
ENV PATH="${PREFIX}/${TARGET}/build/bin:${PATH}"
#
# Install CBC
#
RUN echo "" && \
    echo "==============" && \
    echo "INSTALLING CBC" && \
    echo "==============" && \
    echo ""
ARG PREFIX="/root"
ARG TARGET="Cbc-2.9.9"
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz
RUN cd ${PREFIX} && wget -q "https://www.coin-or.org/download/source/Cbc/${TARGET}.tgz"
RUN cd ${PREFIX} && tar xf ${TARGET}.tgz
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz
RUN cd ${PREFIX}/${TARGET}/ThirdParty/ASL && ./get.ASL 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Blas && ./get.Blas 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Glpk && ./get.Glpk 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Lapack && ./get.Lapack 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Metis && ./get.Metis 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Mumps && ./get.Mumps 2> /dev/null
RUN mkdir ${PREFIX}/${TARGET}/build
RUN cd ${PREFIX}/${TARGET}/build  && \
    ../configure CXX=g++ CC=gcc F77=gfortran --disable-mysql > /dev/null && \
    make -j4 > /dev/null && \
    make install > /dev/null
ENV PATH="${PREFIX}/${TARGET}/build/bin:${PATH}"
#
# Install common Python libraries
#
RUN echo "" && \
    echo "======================" && \
    echo "INSTALLING PYTHON LIBS" && \
    echo "======================" && \
    echo ""
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
