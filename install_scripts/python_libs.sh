RUN echo "" && \
    echo "======================" && \
    echo "INSTALLING PYTHON LIBS" && \
    echo "======================" && \
    echo ""
RUN pip install -U \
      pip \
      setuptools \
      wheel
RUN (python -c "import __pypy__" &> /dev/null && pip install numpy==1.15.4) || pip install numpy
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
# These may fail on PyPy
RUN pip install scipy || echo failed to install scipy
RUN pip install matplotlib || echo failed to install matplotlib
RUN pip install seaborn || echo failed to install seaborn
RUN pip install PyYAML || \
    pip install https://github.com/yaml/pyyaml/archive/4.1.zip || \
    echo failed to install PyYAML
RUN pip install numba || echo failed to install numba
RUN pip install pandas || echo failed to install pandas
RUN pip install pyodbc || echo failed to install pyodbc
