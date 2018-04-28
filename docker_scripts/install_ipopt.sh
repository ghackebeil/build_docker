#
# Install Ipopt
#
ARG PREFIX="/root"
ARG TARGET="Ipopt-3.12.9"
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz
RUN cd ${PREFIX} && wget -q "https://www.coin-or.org/download/source/Ipopt/${TARGET}.tgz"
RUN cd ${PREFIX} && tar xf ${TARGET}.tgz
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz
RUN cd ${PREFIX}/${TARGET}/ThirdParty/ASL && ./get.ASL
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Blas && ./get.Blas
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Lapack && ./get.Lapack
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Metis && ./get.Metis
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Mumps && ./get.Mumps
RUN mkdir ${PREFIX}/${TARGET}/build
RUN cd ${PREFIX}/${TARGET}/build  && \
    ../configure CXX=g++ CC=gcc F77=gfortran && \
    make -j4 > /dev/null && \
    make install
ENV PATH="${PREFIX}/${TARGET}/build/bin:${PATH}"
