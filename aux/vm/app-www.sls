{% import 'aux/globals.j2' as globals %}
{% set vmname = 'app-www' %}
{% set template = 'template-debian-10-www' %}

{{ vmname }}-create:
  qvm.present:
    - name: '{{ vmname }}'
    - template: '{{ template }}'
    - label: 'red'
