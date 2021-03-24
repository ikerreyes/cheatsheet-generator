
cheatsheet-generator
====================

A simple html generator that transforms a
an ini-like file (one that can be read with
`configobj <https://pypi.org/project/configobj/>`_)
into a HTML cheatsheet.

Already built images can be found in the
`build` directory:

- `conda <https://htmlpreview.github.io/?https://github.com/ikerreyes/cheatsheet-generator/blob/master/build/conda.html>`_
- `git <https://htmlpreview.github.io/?https://github.com/ikerreyes/cheatsheet-generator/blob/master/build/git.html>`_
  (and a `basic version <https://htmlpreview.github.io/?https://github.com/ikerreyes/cheatsheet-generator/blob/master/build/git.basic.html>`_)
- `python packages <https://htmlpreview.github.io/?https://github.com/ikerreyes/cheatsheet-generator/blob/master/build/python_packages.html>`_
- `screen <https://htmlpreview.github.io/?https://github.com/ikerreyes/cheatsheet-generator/blob/master/build/screen.html>`_

How to use
----------

Install Python (and configobj and jinja2)
and SASS and then
run the Makefile: all cheatsheets in the raw folder
will be built.

License
-------

`GNU GPL v3 <https://opensource.org/licenses/GPL-3.0>`_
