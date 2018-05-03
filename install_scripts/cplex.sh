#
# Install Cplex
#
RUN echo "" && \
    echo "================" && \
    echo "INSTALLING CPLEX" && \
    echo "================" && \
    echo ""
ENV CPLEX_VERSION="12.8"
ARG TARGET="Cplex-${CPLEX_VERSION}"
ARG INSTALLER="cplex_studio128.linux-x86-64.bin"
RUN cd ${PREFIX} && \
    echo INSTALLER_UI=silent > installer.properties && \
    echo LICENSE_ACCEPTED=TRUE >> installer.properties && \
    echo USER_INSTALL_DIR=${PREFIX}/${TARGET} >> installer.properties && \
    echo -fileOverwrite_${PREFIX}/${TARGET}/README.html=Yes >> installer.properties && \
    echo -fileOverwrite_${PREFIX}/${TARGET}/opl/oplide/oplide=Yes >> installer.properties && \
    echo -fileOverwrite_${PREFIX}/${TARGET}/Uninstall/symlinks-linux.sh=Yes >> installer.properties && \
    echo -fileOverwrite_${PREFIX}/${TARGET}/Uninstall/Uninstall.lax=Yes >> installer.properties && \
    chmod u+x ./${INSTALLER} && \
    ./${INSTALLER} && \
    rm ./${INSTALLER} && \
    rm ./installer.properties && \
    rm ${TARGET}/ops && \
    rm ${TARGET}/doc && \
    rm ${TARGET}/cpoptimizer
# python 2.7
RUN [ "$(python -c'import sys;print(sys.version_info[:2])')" != "(2, 7)" ] || \
    (cd ${PREFIX}/${TARGET}/cplex/python/2.7/x86-64_linux && \
     python setup.py install > /dev/null && \
     python -c "import cplex")
# python 3.5
RUN [ "$(python -c'import sys;print(sys.version_info[:2])')" != "(3, 5)" ] || \
    (cd ${PREFIX}/${TARGET}/cplex/python/3.5/x86-64_linux && \
     python setup.py install > /dev/null && \
     python -c "import cplex")
# python 3.6
RUN [ "$(python -c'import sys;print(sys.version_info[:2])')" != "(3, 6)" ] || \
    (cd ${PREFIX}/${TARGET}/cplex/python/3.6/x86-64_linux && \
     python setup.py install > /dev/null && \
     python -c "import cplex")
ENV PATH="${PREFIX}/${TARGET}/cplex/bin/x86-64_linux:${PATH}"
ARG TARGET
ARG INSTALLER
