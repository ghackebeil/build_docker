RUN echo "" && \
    echo "=====================" && \
    echo "INSTALLING CPLEX_AMPL" && \
    echo "=====================" && \
    echo ""
ARG TARGET="cplex"
RUN cd ${PREFIX} && \
    rm -rf ${TARGET}.gz && \
    wget -q "https://ampl.com/netlib/ampl/student/linux64/${TARGET}.gz" && \
    gunzip -q ${TARGET}.gz && \
    mkdir -p Cplex/bin && \
    mv ${TARGET} Cplex/bin/cplexamp && \
    chmod u+x Cplex/bin/cplexamp && \
    echo CPLEX_AMPL_VERSION `Cplex/bin/cplexamp -v | grep -Po '\d+.\d+.\d+'` >> ${DYNAMIC_VARS_FILE}
ENV PATH="${PREFIX}/Cplex/bin:${PATH}"
ARG TARGET
