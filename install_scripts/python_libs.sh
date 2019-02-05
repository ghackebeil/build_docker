RUN echo "" && \
    echo "======================" && \
    echo "INSTALLING PYTHON LIBS" && \
    echo "======================" && \
    echo ""
RUN pip install --no-cache-dir -U \
      pip \
      setuptools \
      wheel
RUN (python -c "import __pypy__" &> /dev/null && pip install --no-cache-dir numpy==1.15.4) || pip install --no-cache-dir numpy
RUN pip install --no-cache-dir \
      sphinx \
      sphinx_rtd_theme \
      virtualenv \
      cffi \
      numpy \
      scipy \
      matplotlib \
      seaborn \
      mpi4py \
      cryptography \
      sympy \
      networkx \
      Pyro4 \
      dill \
      ipython \
      openpyxl \
      pymysql \
      xlrd
# These may fail on PyPy / Python 3.7
RUN pip install --no-cache-dir PyYAML || \
    pip install https://github.com/yaml/pyyaml/archive/4.1.zip || \
    echo failed to install PyYAML
RUN pip install --no-cache-dir numba || echo failed to install numba
RUN pip install --no-cache-dir pandas || echo failed to install pandas
RUN pip install --no-cache-dir pyodbc || echo failed to install pyodbc
