{% set vmname = 'dvm-debian-10' %}
{% set template = 'template-debian-10' %}

{{ vmname }}-create:
  qvm.present:
    - name: '{{ vmname }}'
    - template: '{{ template }}'
    - label: 'black'

{{ vmname }}-prefs:
  qvm.prefs:
    - name: '{{ vmname }}'
    - netvm: ''
    - include-in-backups: false
    - template-for-dispvms: true

{{ vmname }}-management-dispvm:
  cmd.run:
    - name: 'qubes-prefs management-dispvm "{{ vmname }}"'
    - onlyif: '[[ "$(qubes-prefs management-dispvm)" != "{{ vmname }}" ]]'
