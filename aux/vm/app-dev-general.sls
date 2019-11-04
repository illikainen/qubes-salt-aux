{% import 'aux/globals.j2' as globals %}
{% set vmname = 'app-dev-general' %}
{% set template = 'template-debian-10-dev' %}

{{ vmname }}-vm:
  qvm.vm:
    - name: '{{ vmname }}'
    - present:
      - template: '{{ template }}'
      - label: 'green'
    - service:
      - enable:
        - 'crond'
    - tags:
      - add:
        - '{{ globals.tags.allow_gpg }}'
        - '{{ globals.tags.allow_ssh_agent }}'

{{ vmname }}-firewall:
  cmd.script:
    - name: |
        aux-firewall.py '{{ vmname }}' --rules \
          'action=accept dstports=22 proto=tcp' \
          'action=accept dstports=443 proto=tcp' \
          'action=accept specialtarget=dns' \
          'action=drop'
    - source: 'salt://aux/files/aux-firewall.py'
    - stateful: True
