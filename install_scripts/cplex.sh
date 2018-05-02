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
    echo 'INSTALLER_UI=silent\n\
LICENSE_ACCEPTED=TRUE\n\
USER_INSTALL_DIR=${PREFIX}/${TARGET}\n\
-fileOverwrite_${PREFIX}/${TARGET}/README.html=Yes\n\
-fileOverwrite_${PREFIX}/${TARGET}/opl/oplide/oplide=Yes\n\
-fileOverwrite_${PREFIX}/${TARGET}/Uninstall/symlinks-linux.sh=Yes\n\
-fileOverwrite_${PREFIX}/${TARGET}/Uninstall/Uninstall.lax=Yes\n' > installer.properties && \
    chmod u+x ./${INSTALLER} && \
    ./${INSTALLER} && \
    rm ./${INSTALLER}
    rm ./installer.properties && \
ENV PATH="${PREFIX}/${TARGET}/cplex/bin/x86-64_linux:${PATH}"
ARG TARGET
ARG INSTALLER
