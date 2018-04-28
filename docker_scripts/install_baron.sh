#
# Install Baron
#
RUN echo ""
RUN echo "================"
RUN echo "INSTALLING BARON"
RUN echo "================"
RUN echo ""
ARG PREFIX="/root"
ARG TARGET="baron-lin64"
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip
RUN cd ${PREFIX} && wget -q "https://www.minlp.com/downloads/xecs/baron/current/${TARGET}.zip"
RUN cd ${PREFIX} && unzip -q ${TARGET}.zip
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip
ENV PATH="${PREFIX}/${TARGET}:${PATH}"
