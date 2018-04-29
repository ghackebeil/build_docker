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
#
# Install GAMS Python API (but not on PyPy or CPython-3.5)
#
# python 2.6
RUN [ -z "${GAMS_VERSION}" ] || \
    [ "$(python -c'import sys;print(sys.version_info[:2])')" != "(2, 6)" ] || \
    (cd ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/Python/api_26 && \
     python setup.py install && \
     python -c "import gams")
# python 2.7
RUN [ -z "${GAMS_VERSION}" ] || \
    [ "$(python -c'import sys;print(sys.version_info[:2])')" != "(2, 7)" ] || \
    (cd ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/Python/api && \
     python setup.py install && \
     python -c "import gams")
# python 3.4
RUN [ -z "${GAMS_VERSION}" ] || \
    [ "$(python -c'import sys;print(sys.version_info[:2])')" != "(3, 4)" ] || \
    (cd ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/Python/api_34 && \
     python setup.py install && \
     python -c "import gams")
# python 3.6
RUN [ -z "${GAMS_VERSION}" ] || \
    [ "$(python -c'import sys;print(sys.version_info[:2])')" != "(3, 6)" ] || \
    (cd ${PREFIX}/GAMS_${GAMS_VERSION}/${GAMS_DIR}/apifiles/Python/api_36 && \
     python setup.py install && \
     python -c "import gams")
