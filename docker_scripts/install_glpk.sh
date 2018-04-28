#
# Install Glpk
#
RUN echo ""
RUN echo "==============="
RUN echo "INSTALLING GLPK"
RUN echo "==============="
RUN echo ""
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
