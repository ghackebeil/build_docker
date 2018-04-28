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
