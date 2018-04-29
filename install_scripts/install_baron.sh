#
# Install Baron
#
RUN echo "" && \
    echo "================" && \
    echo "INSTALLING BARON" && \
    echo "================" && \
    echo ""
ARG TARGET="baron-lin64"
RUN cd ${PREFIX} && \
    rm -rf ${TARGET}.zip && \
    wget -q "https://www.minlp.com/downloads/xecs/baron/current/${TARGET}.zip" && \
    unzip -q ${TARGET}.zip && \
    rm -rf ${TARGET}.zip
ENV PATH="${PREFIX}/${TARGET}:${PATH}"
ARG TARGET
