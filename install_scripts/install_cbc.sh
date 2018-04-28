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
RUN cd ${PREFIX} && \
    rm -rf ${TARGET}.tgz && \
    wget -q "https://www.coin-or.org/download/source/Cbc/${TARGET}.tgz" && \
    tar xf ${TARGET}.tgz && \
    rm -rf ${TARGET}.tgz
RUN cd ${PREFIX}/${TARGET}/ThirdParty/ASL && ./get.ASL 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Blas && ./get.Blas 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Glpk && ./get.Glpk 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Lapack && ./get.Lapack 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Metis && ./get.Metis 2> /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Mumps && ./get.Mumps 2> /dev/null
RUN mkdir ${PREFIX}/${TARGET}/build && \
    cd ${PREFIX}/${TARGET}/build && \
    ../configure CXX=g++ CC=gcc F77=gfortran --disable-mysql > /dev/null && \
    make -j4 > /dev/null && \
    make install > /dev/null
ENV PATH="${PREFIX}/${TARGET}/build/bin:${PATH}"
