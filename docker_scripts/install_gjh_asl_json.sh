#
# Install gjh_asl_json
#
ARG PREFIX="/root"
ARG TARGET="gjh_asl_json-master"
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip && cd -
RUN cd ${PREFIX} && wget "https://codeload.github.com/ghackebeil/gjh_asl_json/zip/master" -O ${TARGET}.zip && cd -
RUN cd ${PREFIX} && unzip ${TARGET}.zip && cd -
RUN cd ${PREFIX} && rm -rf ${TARGET}.zip && cd -
RUN cd ${PREFIX}/${TARGET}/Thirdparty && ./get.ASL && cd -
RUN cd ${PREFIX}/${TARGET} && make && cd -
ENV PATH="${PREFIX}/${TARGET}/bin:${PATH}"
