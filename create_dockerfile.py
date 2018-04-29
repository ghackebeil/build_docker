import os
import argparse

# TODO: A LABEL entries
# (e.g., LABEL maintainer="...")
base = \
"""FROM {source_image}
CMD ["/bin/bash"]

"""

installs = []#'install_scripts/install_libs.sh',
#            'install_scripts/install_gams.sh',
#            'install_scripts/install_baron.sh']
#            'install_scripts/install_gjh_asl_json.sh',
#            'install_scripts/install_glpk.sh',
#            'install_scripts/install_ipopt.sh',
#            'install_scripts/install_cbc.sh']
python_installs = []#'install_scripts/install_python_libs.sh']
python_nopypy_installs = []#'install_scripts/install_python_libs_nopypy.sh']

def create_dockerfile(source_image, python_exe, dirname):
    out = base.format(source_image=source_image)
    if python_exe != 'python':
        out += ('RUN ln -s "$(which {python_exe})" '
                '/usr/local/bin/python\n'.\
                format(python_exe=python_exe))

    out += "ARG PREFIX=/root\n"
    for fname in installs:
        with open(fname) as f:
            out += f.read()
    for fname in python_installs:
        with open(fname) as f:
            out += f.read()
    if 'pypy' not in source_image:
        for fname in python_nopypy_installs:
            with open(fname) as f:
                out += f.read()
    if not os.path.exists(dirname):
        os.makedirs(dirname)
    with open(os.path.join(dirname,'Dockerfile'),'w') as f:
        f.write(out)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'source_image',
        help='The source image to start from')
    parser.add_argument(
        'python_exe',
        help=('The name of the python executable '
              'found in the source image'))
    parser.add_argument(
        'dirname',
        help=('The name of the output directory '
              'where the Dockerfile should be placed'))
    args = parser.parse_args()
    create_dockerfile(args.source_image,
                      args.python_exe,
                      args.dirname)
