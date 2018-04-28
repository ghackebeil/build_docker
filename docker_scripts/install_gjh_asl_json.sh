#
# Install gjh_asl_json
#
RUN echo "" && \
    echo "=======================" && \
    echo "INSTALLING GJH_ASL_JSON" && \
    echo "=======================" && \
    echo ""
ARG PREFIX="/root"
ARG TARGET="gjh_asl_json-master"
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip
RUN cd ${PREFIX} && wget -q "https://codeload.github.com/ghackebeil/gjh_asl_json/zip/master" -O ${TARGET}.zip
RUN cd ${PREFIX} && unzip -q ${TARGET}.zip
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip
RUN cd ${PREFIX}/${TARGET}/Thirdparty && ./get.ASL > /dev/null
RUN cd ${PREFIX}/${TARGET} && make > /dev/null
ENV PATH="${PREFIX}/${TARGET}/bin:${PATH}"
