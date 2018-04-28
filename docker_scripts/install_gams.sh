#
# Install GAMS
#
RUN echo ""
RUN echo "==============="
RUN echo "INSTALLING GAMS"
RUN echo "==============="
RUN echo ""
ARG PREFIX="/root"
ARG TARGET="linux_x64_64_sfx.exe"
ARG VERSION="25.0.3"
RUN mkdir ${PREFIX}/GAMS_${VERSION}
RUN cd ${PREFIX}/GAMS_${VERSION} && \
    wget -q "https://d37drm4t2jghv5.cloudfront.net/distributions/${VERSION}/linux/${TARGET}"
RUN cd ${PREFIX}/GAMS_${VERSION} && chmod u+x ${TARGET}
RUN cd ${PREFIX}/GAMS_${VERSION} && ./${TARGET} > /dev/null
RUN cd ${PREFIX}/GAMS_${VERSION} && rm ${TARGET}
ARG GAMSDIR="`ls ${PREFIX}/GAMS_${VERSION}`"
ENV PATH="${GAMSDIR}:${PATH}"
# TODO: Install GAMS Python API
# python 2.6
#cd ${GAMSDIR}/apifiles/Python/api_26 && python setup.py install
# python 2.7
#cd ${GAMSDIR}/apifiles/Python/api && python setup.py install
# python 3.4 / 3.5
#cd ${GAMSDIR}/apifiles/Python/api_34 && python setup.py install
# python 3.6
#cd ${GAMSDIR}/apifiles/Python/api_36 && python setup.py install
