#
# Install Glpk
#
RUN echo "" && \
    echo "===============" && \
    echo "INSTALLING GLPK" && \
    echo "===============" && \
    echo ""
ARG TARGET="glpk-4.65"
RUN cd ${PREFIX} && \
    rm -rf ${TARGET}.tar.gz && \
    wget -q "https://ftp.gnu.org/gnu/glpk/${TARGET}.tar.gz" && \
    tar xf ${TARGET}.tar.gz && \
    rm -rf ${TARGET}.tar.gz
RUN mkdir ${PREFIX}/${TARGET}/build && \
    cd ${PREFIX}/${TARGET}/build && \
    ../configure CXX=g++ CC=gcc F77=gfortran --prefix=${PREFIX}/${TARGET}/build > /dev/null && \
    make -j4 > /dev/null && \
    make install > /dev/null
ENV PATH="${PREFIX}/${TARGET}/build/bin:${PATH}"
ARG TARGET
