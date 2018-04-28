#
# Install common Python libraries
#
RUN echo "" && \
    echo "======================" && \
    echo "INSTALLING PYTHON LIBS" && \
    echo "======================" && \
    echo ""
RUN pip install -U pip setuptools wheel
RUN pip install cffi
RUN pip install numpy
RUN pip install scipy
RUN pip install matplotlib
RUN pip install mpi4py
RUN pip install cryptography
RUN pip install sympy
RUN pip install networkx
RUN pip install PyYAML
RUN pip install Pyro4
RUN pip install dill
RUN pip install ipython
RUN pip install openpyxl
RUN pip install pymysql
RUN pip install xlrd
