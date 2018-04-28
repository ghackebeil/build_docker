#
# Install CBC
#
ARG PREFIX="/root"
ARG TARGET="Cbc-2.9.9"
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz
RUN cd ${PREFIX} && wget -q "https://www.coin-or.org/download/source/Cbc/${TARGET}.tgz"
RUN cd ${PREFIX} && tar xf ${TARGET}.tgz
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz
RUN cd ${PREFIX}/${TARGET}/ThirdParty/ASL && ./get.ASL
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Blas && ./get.Blas
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Glpk && ./get.Glpk
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Lapack && ./get.Lapack
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Metis && ./get.Metis
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Mumps && ./get.Mumps
RUN mkdir ${PREFIX}/${TARGET}/build
RUN cd ${PREFIX}/${TARGET}/build  && \
    ../configure CXX=g++ CC=gcc F77=gfortran --disable-mysql && \
    make -j4 > /dev/null && \
    make install
ENV PATH="${PREFIX}/${TARGET}/build/bin:${PATH}"
