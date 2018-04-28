#
# Install GAMS
#
RUN echo "" && \
    echo "===============" && \
    echo "INSTALLING GAMS" && \
    echo "===============" && \
    echo ""
ARG PREFIX="/root"
ARG TARGET="linux_x64_64_sfx.exe"
ARG VERSION="25.0.3"
ARG GAMSDIR="gams25.0_linux_x64_64_sfx"
RUN mkdir ${PREFIX}/GAMS_${VERSION} && \
    cd ${PREFIX}/GAMS_${VERSION} && \
    wget -q "https://d37drm4t2jghv5.cloudfront.net/distributions/${VERSION}/linux/${TARGET}" && \
    chmod u+x ${TARGET} && \
    ./${TARGET} > /dev/null && \
    rm ${TARGET}
ENV PATH="${PREFIX}/GAMS_${VERSION}/${GAMSDIR}:${PATH}"
# TODO: Install GAMS Python API
# python 2.6
#cd ${GAMSDIR}/apifiles/Python/api_26 && python setup.py install
# python 2.7
#cd ${GAMSDIR}/apifiles/Python/api && python setup.py install
# python 3.4 / 3.5
#cd ${GAMSDIR}/apifiles/Python/api_34 && python setup.py install
# python 3.6
#cd ${GAMSDIR}/apifiles/Python/api_36 && python setup.py install
