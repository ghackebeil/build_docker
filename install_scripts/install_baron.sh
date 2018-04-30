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
# dummy baron input file
RUN echo 'OPTIONS {\n\
results: 1;\n\
ResName: "dummy.res";\n\
summary: 1;\n\
SumName: "dummy.sum";\n\
times: 1;\n\
TimName: "dummy.tim";\n\
}\n\
POSITIVE_VARIABLES x1;\n\
OBJ: minimize x1;\n' > dummy.bar
# note the one can not assign the output of a command to an 'ENV var=' declaration
# so we must use 'RUN export var='
RUN echo BARON_VERSION=`baron -f dummy.bar | grep -Po 'BARON version .*\. Built' | grep -Po '\d+.\d+.\d+'`
RUN echo BARON_VERSION=`baron -f dummy.bar | grep -Po 'BARON version .*\. Built' | grep -Po '\d+.\d+.\d+'` >> ${DYNAMIC_VARS_FILE}
RUN rm -f dummy.bar dummy.res dummy.sum dummy.tim dummy.prob
