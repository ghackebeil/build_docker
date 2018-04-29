#
# Install GAMS
#
RUN echo "" && \
    echo "===============" && \
    echo "INSTALLING GAMS" && \
    echo "===============" && \
    echo ""
ARG TARGET="linux_x64_64_sfx.exe"
ARG GAMS_VERSION="25.0.3"
ARG GAMS_DIR="gams25.0_linux_x64_64_sfx"
RUN mkdir ${PREFIX}/GAMS_${GAMS_VERSION} && \
    cd ${PREFIX}/GAMS_${GAMS_VERSION} && \
    wget -q "https://d37drm4t2jghv5.cloudfront.net/distributions/${GAMS_VERSION}/linux/${TARGET}" && \
    chmod u+x ${TARGET} && \
    ./${TARGET} > /dev/null && \
    rm ${TARGET} && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/GMSPython && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/testlib_ml && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/docs && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/C && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/CPPnet && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/Data && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/Fortran && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/Java && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/VBA && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/C++ && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/CSharp && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/Delphi && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/GAMS && \
    rm -r ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/VBnet
ENV PATH="${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}:${PATH}"
ARG TARGET
