from distutils.core import setup
from Cython.Build import cythonize

setup(
    ext_modules=cythonize(module_list=["chat.pyx"],language_level=3)
)