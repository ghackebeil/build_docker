RUN PREFIX=/root
RUN TARGET="cmake-3.11.1-Linux-x86_64"
RUN cd ${PREFIX} && rm -rf ${TARGET}.tar.gz && cd -
RUN cd ${PREFIX} && wget -q https://cmake.org/files/v3.11/${TARGET}.tar.gz && cd -
RUN cd ${PREFIX} && tar xfz ${TARGET}.tar.gz && cd -
RUN cd ${PREFIX} && rm -rf ${TARGET}.tar.gz && cd -
RUN cd ${PREFIX} && cp -r ${TARGET}/* / && cd -
RUN cd ${PREFIX} && rm -r ${TARGET} && cd -
