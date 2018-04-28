import os

outdir = 'builds'

base = \
"""FROM {image}

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

for image, python_exe, name in image_list:
    out = base.format(image=image)
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
    print(name)
    dst = os.path.join(outdir,name)
    if not os.path.exists(dst):
        os.makedirs(dst)
    with open(os.path.join(dst,'Dockerfile'),'w') as f:
        f.write(out)

"""
import yaml
with open('.travis.yml') as f:
    pass
"""
