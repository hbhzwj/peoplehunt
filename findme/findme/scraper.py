#!/usr/bin/env python
"""
Usage:
    scraper.py <input>
    scraper.py -h | --help | --version

"""
import subprocess
from docopt import docopt
from __init__ import __version__

def command_line_options():
  args = docopt(__doc__, version=__version__)
  with open(args['<input>']) as f:
    names = f.readlines()

  for i in names:
    subprocess.call(["./findme.py", i])

if __name__ == '__main__':
    command_line_options()
