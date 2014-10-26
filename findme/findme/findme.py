#!/usr/bin/env python
"""
Usage: 
    findme.py <query>
    findme.py -h | --help | --version

"""
from __future__ import absolute_import, print_function
from __init__ import __version__
from docopt import docopt
from pyquery import PyQuery as pg
import re
import yaml
import json
import requests
from urllib import quote as url_quote
from urllib import unquote as url_unquote

SEARCH_QUERY = 'http://www.google.com/search?q={0}'
SOURCES = ['linkedin']
RE_LINK = re.compile('.*q=(.*?)&.*')

with open('profiles.yaml', 'r') as profiles_file:
    profile_configs = yaml.load(profiles_file)

print(profile_configs)

def get_profile(link):
    profile = None
    link_source = None
    for source in SOURCES:
        if source in link:
            link_source = source
    if link_source:
       profile_config = profile_configs[link_source]
       for config in profile_config:
           if re.match(config['pattern'], link):
               break
     
       is_list = config['is_list']
       copy_config = dict([(k,v) for k,v in config.iteritems()
           if k not in ['pattern', 'is_list']])

       if not is_list:
           profile = get_profile_by_page(link, copy_config)
    return profile


def get_profile_by_list(link, config):
    pass


def get_profile_by_page(link, config):
    html = pg(requests.get(link).text)
    profile = {}

    for k, v in config.iteritems():
        if isinstance(v, list):
            for i in v:
                result = html(i)
                if result:
                    break
        else:
            result = html(v)
            
        if len(result) > 1:
            result_set = []
            for r in result:
                result_text = r.text_content()
                result_text = result_text.strip()
                if result_text not in result_set:
                    result_set.append(result_text)
            profile[k] = ','.join(result_set)
        else:
            profile[k] = result.text().strip()

    return profile


def get_profiles(args):
    query = args['<query>']

    links = get_links(query)
    print('Links: ', links)

    if not links:
        return

    profiles = []
    for link in links:
        profile = get_profile(link)
        if profile:
            profiles.append(profile)

    return profiles


def get_links(text):
    query = SEARCH_QUERY.format(url_quote(text))
    print('Query: ', query)

    html = pg(requests.get(query).text)
    links = [a.attrib['href'] for a in html('.r')('a')]
    result = []

    for link in links:
        # q={url}
        match_result = RE_LINK.match(link)
        if not match_result:
            continue
        link = match_result.groups()[0]
        result.append(url_unquote(link))

    return result


def command_line_options():
    args = docopt(__doc__, version=__version__)

    if not args['<query>']:
        return

    profiles = get_profiles(args)

    print(json.dumps(profiles))

if __name__ == '__main__':
    command_line_options()
