{% import 'aux/globals.j2' as globals %}
{% set vmname = 'disp-updates' %}

{{ vmname }}-create:
  qvm.present:
    - name: '{{ vmname }}'
    - template: 'dvm-fedora-30'
    - label: 'green'
    - class: 'DispVM'
    - onlyif: qvm-check dvm-fedora-30

{{ vmname }}-create-fallback:
  qvm.present:
    - name: '{{ vmname }}'
    - template: 'fedora-29-dvm'
    - label: 'green'
    - class: 'DispVM'
    - unless: qvm-check template-fedora-30

{{ vmname }}-prefs:
  qvm.prefs:
    - name: '{{ vmname }}'
    - include-in-backups: false
    - memory: 256
    - netvm: '*default*'

{{ vmname }}-services:
  qvm.service:
    - name: '{{ vmname }}'
    - enable:
      - 'qubes-updates-proxy'

{{ vmname }}-updatevm:
  cmd.run:
    - name: 'qubes-prefs updatevm "{{ vmname }}"'
    - onlyif: '[[ "$(qubes-prefs updatevm)" != "{{ vmname }}" ]]'

{{ vmname }}-firewall:
  cmd.script:
    - name: 'aux-firewall.py "{{ vmname }}"'
    - source: 'salt://aux/files/aux-firewall.py'
    - stateful: True

# I prefer to keep installed templates in a prestine condition and clone them
# in a base template that is kept up-to-date and that is meant to be used by
# other templates.
#
# This state file aims to block the prestine templates from the UpdatesProxy
# service (which, afaik, is the only way for them to communicate with the
# outside world by default).
{{ vmname }}-updatesproxy:
  file.managed:
    - name: '/etc/qubes-rpc/policy/qubes.UpdatesProxy'
    - source: 'salt://aux/files/policy/qubes.UpdatesProxy'
    - template: 'jinja'
    - backup: False
    - context:
      update_tag: '{{ globals.tags.allow_update }}'
      update_vm: '{{ vmname }}'
