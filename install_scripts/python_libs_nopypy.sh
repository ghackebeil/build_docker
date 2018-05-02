#
# Install common Python libraries
# (that do not work on PyPy)
#
RUN echo "" && \
    echo "===========================" && \
    echo "INSTALLING MORE PYTHON LIBS" && \
    echo "===========================" && \
    echo ""
RUN pip install --no-cache-dir \
    numba \
    pandas \
    pyodbc
