import os
import argparse
import tempfile

base = \
"""FROM {source_image}

MAINTAINER Pyomo Developers

"""

image_list = [('pypy:2','pypy','pypy_2'),
              ('pypy:3','pypy3','pypy_3'),
              ('python:2.7','python','python_2.7'),
              ('python:3.5','python','python_3.5'),
              ('python:3.6','python','python_3.6'),
              ('continuumio/anaconda','python','anaconda_2'),
              ('continuumio/anaconda3','python','anaconda_3')]

installs = ['docker_scripts/install_libs.sh',
            'docker_scripts/install_gams.sh',
            'docker_scripts/install_baron.sh',
            'docker_scripts/install_gjh_asl_json.sh',
            'docker_scripts/install_glpk.sh',
            'docker_scripts/install_ipopt.sh',
            'docker_scripts/install_cbc.sh',
            'docker_scripts/install_python_libs.sh']

def create_dockerfile(source_image, python_exe, dirname):
    out = base.format(source_image=source_image)
    if python_exe != 'python':
        out += ('RUN ln -s "$(which {python_exe})" '
                '/usr/local/bin/python\n'.\
                format(python_exe=python_exe))
    for fname in installs:
        with open(fname) as f:
            out += f.read()
    # TODO
    #else: pypy
    #    out += 'RUN pip install -U pandas'
    #    out += 'RUN pip install -U numba'
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
"""
import yaml
with open('.travis.yml') as f:
    pass
"""
