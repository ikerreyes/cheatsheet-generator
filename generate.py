import os
import sys

from configobj import ConfigObj
from jinja2 import Environment, FileSystemLoader


def get_row(values):
    if isinstance(values, str):
        l = values.split('$$')
    else:
        l = values
    return l[0], [] if len(l) == 1 else l[1:]

def load_configuration(file):
    lines = []
    prev_line = []
    with open(file) as fd:
        for line in fd:
            current_line = line.strip()
            if current_line:
                prev_line.append(current_line)
            else:
                lines.append(' '.join(prev_line))
                prev_line = []
        else:
            lines.append(' '.join(prev_line))
    return lines


def generate_cheatsheet(configuration_file, output_file, static=False):
    try:
        os.remove(output_file)
    except OSError:
        pass

    kw = {}

    items = ConfigObj(configuration_file)

    kw['is_static'] = static

    title = items.pop('title', os.path.basename(configuration_file))

    kw['name'] = title

    kw['columns'] = items.pop('columns', 2)

    footer = items.pop('footer', None)
    if footer is not None:
        kw['footer'] = footer

    kw['items'] = items

    directory = os.path.dirname(os.path.abspath(__file__))
    env = Environment(loader=FileSystemLoader(os.path.join(directory, 'templates')))
    env.globals['get_row'] = get_row

    with open(os.path.join(output_file), 'w') as fd:
        fd.write(env.get_template('cheatsheet.html').render(**kw))


if __name__ == '__main__':
    generate_cheatsheet(sys.argv[1], sys.argv[2])
