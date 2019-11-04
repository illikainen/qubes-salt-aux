{% set vmname = 'dvm-debian-10-www' %}
{% set template = 'template-debian-10-www' %}

{{ vmname }}-create:
  qvm.present:
    - name: '{{ vmname }}'
    - template: '{{ template }}'
    - label: 'yellow'

{{ vmname }}-prefs:
  qvm.prefs:
    - name: '{{ vmname }}'
    - netvm: '*default*'
    - include-in-backups: false
    - template-for-dispvms: true

{{ vmname }}-default-dispvm:
  cmd.run:
    - name: 'qubes-prefs default-dispvm "{{ vmname }}"'
