RUN echo "" && \
    echo "======================" && \
    echo "INSTALLING PYTHON LIBS" && \
    echo "======================" && \
    echo ""
RUN python -O -m pip install --no-cache-dir -U \
      pip \
      setuptools \
      wheel
RUN (python -c "import __pypy__" &> /dev/null && python -O -m pip install --no-cache-dir numpy==1.15.4) || python -O -m pip install --no-cache-dir numpy
RUN python -O -m pip install --no-cache-dir \
      sphinx \
      sphinx_rtd_theme \
      virtualenv \
      cffi \
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
# These may fail on PyPy
RUN python -O -m pip install --no-cache-dir scipy || echo failed to install scipy
RUN python -O -m pip install --no-cache-dir matplotlib || echo failed to install matplotlib
RUN python -O -m pip install --no-cache-dir seaborn || echo failed to install seaborn
RUN python -O -m pip install --no-cache-dir PyYAML || \
    python -O -m pip install https://github.com/yaml/pyyaml/archive/4.1.zip || \
    echo failed to install PyYAML
RUN python -O -m pip install --no-cache-dir numba || echo failed to install numba
RUN python -O -m pip install --no-cache-dir pandas || echo failed to install pandas
RUN python -O -m pip install --no-cache-dir pyodbc || echo failed to install pyodbc
