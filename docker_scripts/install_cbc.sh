#
# Install CBC
#
RUN echo ""
RUN echo "=============="
RUN echo "INSTALLING CBC"
RUN echo "=============="
RUN echo ""
ARG PREFIX="/root"
ARG TARGET="Cbc-2.9.9"
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz
RUN cd ${PREFIX} && wget -q "https://www.coin-or.org/download/source/Cbc/${TARGET}.tgz"
RUN cd ${PREFIX} && tar xf ${TARGET}.tgz
RUN cd ${PREFIX} && rm -rf ${TARGET}.tgz
RUN cd ${PREFIX}/${TARGET}/ThirdParty/ASL && ./get.ASL > /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Blas && ./get.Blas > /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Glpk && ./get.Glpk > /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Lapack && ./get.Lapack > /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Metis && ./get.Metis > /dev/null
RUN cd ${PREFIX}/${TARGET}/ThirdParty/Mumps && ./get.Mumps > /dev/null
RUN mkdir ${PREFIX}/${TARGET}/build
RUN cd ${PREFIX}/${TARGET}/build  && \
    ../configure CXX=g++ CC=gcc F77=gfortran --disable-mysql > /dev/null && \
    make -j4 > /dev/null && \
    make install > /dev/null
ENV PATH="${PREFIX}/${TARGET}/build/bin:${PATH}"
