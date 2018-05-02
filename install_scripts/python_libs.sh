#
# Install common Python libraries
#
RUN echo "" && \
    echo "======================" && \
    echo "INSTALLING PYTHON LIBS" && \
    echo "======================" && \
    echo ""
RUN pip install --no-cache-dir -U \
      pip \
      setuptools && \
    pip install --no-cache-dir \
      sphinx \
      sphinx_rtd_theme
      wheel \
      virtualenv \
      cffi \
      numpy \
      scipy \
      matplotlib \
      mpi4py \
      cryptography \
      sympy \
      networkx \
      PyYAML \
      Pyro4 \
      dill \
      ipython \
      openpyxl \
      pymysql \
      xlrd
