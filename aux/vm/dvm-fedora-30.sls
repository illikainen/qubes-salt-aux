{% set vmname = 'dvm-fedora-30' %}
{% set template = 'template-fedora-30' %}

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
