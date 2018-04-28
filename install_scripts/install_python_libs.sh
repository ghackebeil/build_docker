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
    setuptools \
    wheel \
    virtualenv
RUN pip install --no-cache-dir \
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
