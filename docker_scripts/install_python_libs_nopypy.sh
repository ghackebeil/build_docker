#
# Install common Python libraries
# (that do not work on PyPy)
#
RUN echo "" && \
    echo "===========================" && \
    echo "INSTALLING MORE PYTHON LIBS" && \
    echo "===========================" && \
    echo ""
RUN pip install pandas
RUN pip install pyodbc
