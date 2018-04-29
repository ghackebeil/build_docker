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
RUN echo "OPTIONS {
results: 1;
ResName: \"dummy.res\";
summary: 1;
SumName: \"dummy.sum\";
times: 1;
TimName: \"dummy.tim\";
}
POSITIVE_VARIABLES x1;
OBJ: minimize x1;
" > dummy.bar
RUN export BARON_VERSION=`baron -f dummy.bar | grep -Po 'BARON version .*\. Built' | grep -Po '\d.\d.\d'`
RUN rm -f dummy.bar dummy.res dummy.sum dummy.tim dummy.prob
