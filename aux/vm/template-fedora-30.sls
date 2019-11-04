{% import 'aux/globals.j2' as globals %}
{% set vmname = 'template-fedora-30' %}
{% if salt.qvm.check('fedora-30-base') %}
  {% set template = 'fedora-30-base' %}
{% else %}
  {% set template = 'fedora-30' %}
{% endif %}

{{ vmname }}-clone:
  qvm.clone:
    - name: '{{ vmname }}'
    - source: '{{ template }}'
    - label: 'black'

{{ vmname }}-tags:
  qvm.tags:
    - name: '{{ vmname }}'
    - add:
      - '{{ globals.tags.allow_update }}'
