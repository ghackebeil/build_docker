import os
import argparse

base = \
"""FROM {source_image}
CMD ["/bin/bash"]

COPY coinhsl.tar /root/
"""

installs = ['install_scripts/libs.sh',
#            'install_scripts/cplex.sh',
            'install_scripts/gams.sh',
            'install_scripts/baron.sh',
            'install_scripts/gjh_asl_json.sh',
            'install_scripts/glpk.sh',
            'install_scripts/ipopt.sh',
            'install_scripts/cbc.sh']
python_installs = ['install_scripts/python_libs.sh']
dynamic_vars_filename = '/root/dynamic_vars.out'

def create_dockerfile(source_image, python_exe, dirname):
    out = base.format(source_image=source_image)
    # if the executable is not 'python', then
    # create a symlink
    if python_exe != 'python':
        out += ('RUN ln -s "$(which {python_exe})" '
                '/usr/local/bin/python\n'.\
                format(python_exe=python_exe))
    # destination for downloaded source code
    out += "ARG PREFIX=/root\n"
    # where to place environment variables that had to be
    # determined at runtime (they will be added after the
    # initial build)
    out += ("ARG DYNAMIC_VARS_FILE="+dynamic_vars_filename+"\n")
    out += ("RUN touch "+dynamic_vars_filename+"\n")
    for fname in installs:
        with open(fname) as f:
            out += f.read()
    for fname in python_installs:
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
