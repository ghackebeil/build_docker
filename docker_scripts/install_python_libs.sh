#
# Install common Python libraries
#
RUN echo ""
RUN echo "======================"
RUN echo "INSTALLING PYTHON LIBS"
RUN echo "======================"
RUN echo ""
RUN pip install -U pip setuptools wheel
RUN pip install cffi
RUN pip install numpy
RUN pip install scipy
RUN pip install mpi4py
RUN pip install cryptography
RUN pip install sympy
RUN pip install networkx
RUN pip install PyYAML
RUN pip install Pyro4
RUN pip install dill
RUN pip install pandas
RUN pip install matplotlib
RUN pip install ipython
RUN pip install openpyxl
RUN pip install pymysql
RUN pip install pyodbc
RUN pip install xlrd
