RUN echo "" && \
    echo "======================" && \
    echo "INSTALLING PYTHON LIBS" && \
    echo "======================" && \
    echo ""
RUN pip install -U \
      pip \
      setuptools \
      wheel
RUN ((python -c "import __pypy__" 2> /dev/null) && pip install numpy==1.15.4) || (pip install numpy)
RUN pip install \
      sphinx \
      sphinx_rtd_theme \
      virtualenv \
      cffi \
      mpi4py \
      sympy \
      networkx \
      Pyro4 \
      dill \
      ipython \
      openpyxl \
      pymysql \
      xlrd
# These currently fail on PyPy
RUN (python -c "import __pypy__" 2> /dev/null) || (pip install scipy matplotlib pandas seaborn)
# These may not work on PyPy / Python3.7
RUN pip install PyYAML || \
    pip install https://github.com/yaml/pyyaml/archive/4.1.zip || \
    echo failed to install PyYAML
RUN pip install numba || echo failed to install numba
RUN pip install pyodbc || echo failed to install pyodbc
RUN pip list
