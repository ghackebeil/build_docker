#
# Install GAMS
#
RUN echo "" && \
    echo "===============" && \
    echo "INSTALLING GAMS" && \
    echo "===============" && \
    echo ""
ARG TARGET="linux_x64_64_sfx.exe"
ARG VERSION="25.0.3"
ARG GAMSDIR="gams25.0_linux_x64_64_sfx"
RUN mkdir ${PREFIX}/GAMS_${VERSION} && \
    cd ${PREFIX}/GAMS_${VERSION} && \
    wget -q "https://d37drm4t2jghv5.cloudfront.net/distributions/${VERSION}/linux/${TARGET}" && \
    chmod u+x ${TARGET} && \
    ./${TARGET} > /dev/null && \
    rm ${TARGET} && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/GMSPython && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/testlib_ml && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/docs && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/C && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/CPPnet && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/Data && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/Fortran && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/Java && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/VBA && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/C++ && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/CSharp && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/Delphi && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/GAMS && \
    rm -r ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/VBnet
ENV PATH="${PREFIX}/GAMS_${VERSION}/${GAMSDIR}:${PATH}"
# Install GAMS Python API (but not on PyPy or CPython_3.5)
# python 2.6
RUN python -c "import __pypy__" 2> /dev/null || \
    [ "$(python -c'import sys;print(sys.version_info[:2])')" != "(2, 6)" ] || \
    (cd ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/Python/api_26 && \
     python setup.py install && \
     python -c "import gams")
# python 2.7
RUN python -c "import __pypy__" 2> /dev/null || \
    [ "$(python -c'import sys;print(sys.version_info[:2])')" != "(2, 7)" ] || \
    (cd ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/Python/api && \
     python setup.py install && \
     python -c "import gams")
# python 3.4
RUN python -c "import __pypy__" 2> /dev/null || \
    [ "$(python -c'import sys;print(sys.version_info[:2])')" != "(3, 4)" ] || \
    (cd ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/Python/api_34 && \
     python setup.py install && \
     python -c "import gams")
# python 3.6
RUN python -c "import __pypy__" 2> /dev/null || \
    [ "$(python -c'import sys;print(sys.version_info[:2])')" != "(3, 6)" ] || \
    (cd ${PREFIX}/GAMS_${VERSION}/${GAMSDIR}/apifiles/Python/api_36 && \
     python setup.py install && \
     python -c "import gams")
ARG TARGET
ARG VERSION
ARG GAMSDIR
