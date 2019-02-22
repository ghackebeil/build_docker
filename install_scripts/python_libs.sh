RUN echo "" && \
    echo "======================" && \
    echo "INSTALLING PYTHON LIBS" && \
    echo "======================" && \
    echo ""
RUN pip install -U \
      pip \
      setuptools \
      wheel

ENV DOCKER_PYTHON_CORE=virtualenv
RUN pip install ${DOCKER_PYTHON_CORE}

ENV DOCKER_PYTHON_EXTRAS="sphinx \
      sphinx_rtd_theme \
      cffi \
      numpy \
      mpi4py \
      sympy \
      networkx \
      Pyro4 \
      dill \
      ipython \
      openpyxl \
      pymysql \
      xlrd \
      z3-solver \
      pint \
"
RUN pip install ${DOCKER_PYTHON_EXTRAS}

# These currently fail on PyPy
ENV DOCKER_PYTHON_NOT_PYPY="scipy \
    matplotlib \
    pandas \
    seaborn \
"
RUN (python -c "import __pypy__" 2> /dev/null) || (pip install ${DOCKER_PYTHON_NOT_PYPY})

# These may not work on PyPy / Python3.7
RUN pip install PyYAML || \
    pip install https://github.com/yaml/pyyaml/archive/4.1.zip || \
    echo failed to install PyYAML
RUN pip install numba || echo failed to install numba
RUN pip install pyodbc || echo failed to install pyodbc
RUN pip list

# These are the Python packages that should be removed to return to a
# "SLIM" build
ENV DOCKER_PYTHON_SLIM="${DOCKER_PYTHON_EXTRAS} \
    ${DOCKER_PYTHON_NOT_PYPY} \
    pyyaml \
    numba \
    pyodbc \
"
