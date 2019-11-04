#!/usr/bin/env python3
"""
Set firewall rules for salted qubes.

TODO: implement a proper SaltStack module for qvm-firewall.
"""

import json
import sys
from argparse import ArgumentParser

from qubesadmin import Qubes
from qubesadmin.firewall import Rule

DEFAULT_RULES = [
    'action=accept dsthost=129.132.53.171/32 dstports=443 proto=tcp comment=ethz',
    'action=accept dsthost=130.225.254.116/32 dstports=443 proto=tcp comment=dotsrc',
    'action=accept dsthost=147.75.32.69/32 dstports=443 proto=tcp comment=qubes',
    'action=accept dsthost=209.132.181.23/32 dstports=443 proto=tcp comment=fedoraproject',
    'action=accept dsthost=209.132.181.24/32 dstports=443 proto=tcp comment=fedoraproject',
    'action=accept dsthost=209.132.181.25/32 dstports=443 proto=tcp comment=fedoraproject',
    'action=accept specialtarget=dns',
    'action=drop',
]


def parse_args():
    app = Qubes()
    names = [x.name for x in app.domains if x.klass != 'AdminVM']

    ap = ArgumentParser()
    ap.add_argument('vm', choices=names)
    ap.add_argument('--rules', default=DEFAULT_RULES, nargs='*')

    args = ap.parse_args()
    args.vm = next(x for x in app.domains if x.name == args.vm)
    return args


def main():
    args = parse_args()

    rules = [Rule(x) for x in args.rules]
    if rules != args.vm.firewall.rules:
        args.vm.firewall.rules = rules
        result = {
            'changed': True,
            'comment': 'saved {} rules for {}'.format(len(rules), args.vm.name)
        }
        print(json.dumps(result))
    return 0


if __name__ == '__main__':
    sys.exit(main())
