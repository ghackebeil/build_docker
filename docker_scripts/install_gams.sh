#
# Install GAMS
#
RUN PREFIX=/root
RUN VERSION="25.0.3"
RUN TARGET="linux_x64_64_sfx.exe"
RUN mkdir ${PREFIX}/GAMS_${VERSION}
RUN cd ${PREFIX}/GAMS_${VERSION} && \
    wget "https://d37drm4t2jghv5.cloudfront.net/distributions/${VERSION}/linux/${TARGET}" && \
    cd -
RUN cd ${PREFIX}/GAMS_${VERSION} && chmod u+x ${TARGET} && cd -
RUN cd ${PREFIX}/GAMS_${VERSION} && ./${TARGET} && cd -
RUN cd ${PREFIX}/GAMS_${VERSION} && rm ${TARGET} && cd -
RUN cd ${PREFIX}/GAMS_${VERSION} && GAMSDIR=`ls` && cd -
RUN GAMSDIR=${PREFIX}/GAMS_${VERSION}/${GAMSDIR}
ENV PATH="${GAMSDIR}:${PATH}"
# TODO: Install GAMS Python API
# python 2.6
#cd ${GAMSDIR}/apifiles/Python/api_26 && python setup.py install && cd -
# python 2.7
#cd ${GAMSDIR}/apifiles/Python/api && python setup.py install && cd -
# python 3.4 / 3.5
#cd ${GAMSDIR}/apifiles/Python/api_34 && python setup.py install && cd -
# python 3.6
#cd ${GAMSDIR}/apifiles/Python/api_36 && python setup.py install && cd -
