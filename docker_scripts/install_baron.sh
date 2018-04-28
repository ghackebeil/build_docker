#
# Install Baron
#
ARG PREFIX="/root"
ARG TARGET="baron-lin64"
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip && cd -
RUN cd ${PREFIX} && wget "https://www.minlp.com/downloads/xecs/baron/current/${TARGET}.zip" && cd -
RUN cd ${PREFIX} && unzip ${TARGET}.zip && cd -
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip && cd -
ENV PATH="${PREFIX}/${TARGET}:${PATH}"
