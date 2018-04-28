#
# Install Glpk
#
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
