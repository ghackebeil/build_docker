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
# Install GAMS Python API
# python 2.6
RUN python -c "import __pypy__" 2> /dev/null || \
    [[ "$(python -c'import sys;print(sys.version_info[:2])')" != "(2, 6)" ]] || \
    (cd ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/Python/api_26 && python setup.py install)
# python 2.7
RUN python -c "import __pypy__" 2> /dev/null || \
    [[ "$(python -c'import sys;print(sys.version_info[:2])')" != "(2, 7)" ]] || \
    (cd ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/Python/api && python setup.py install)
# python 3.4
RUN python -c "import __pypy__" 2> /dev/null || \
    [[ "$(python -c'import sys;print(sys.version_info[:2])')" != "(3, 4)" ]] || \
    (cd ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/Python/api_34 && python setup.py install)
# python 3.5 (uses same install directory as 3.4)
RUN python -c "import __pypy__" 2> /dev/null || \
    [[ "$(python -c'import sys;print(sys.version_info[:2])')" != "(3, 4)" ]] || \
    (cd GAMS_25.0.3/gams25.0_linux_x64_64_sfx/apifiles/Python/api_34 && python setup.py install)
# python 3.6
RUN python -c "import __pypy__" 2> /dev/null || \
    [[ "$(python -c'import sys;print(sys.version_info[:2])')" != "(3, 6)" ]] || \
    (cd ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/Python/api_36 && python setup.py install)
# make sure the install worked
RUN python -c "import gams"
