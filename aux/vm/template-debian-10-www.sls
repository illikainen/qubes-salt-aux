{% import 'aux/globals.j2' as globals %}
{% set vmname = 'template-debian-10-www' %}
{% if salt.qvm.check('debian-10-base') %}
  {% set template = 'debian-10-base' %}
{% else %}
  {% set template = 'debian-10' %}
{% endif %}

{{ vmname }}-clone:
  qvm.clone:
    - name: '{{ vmname }}'
    - source: '{{ template }}'
    - label: 'black'

{{ vmname }}-prefs:
  qvm.prefs:
    - name: '{{ vmname }}'
    - kernelopts: nopat apparmor=1 security=apparmor

{{ vmname }}-tags:
  qvm.tags:
    - name: '{{ vmname }}'
    - add:
      - '{{ globals.tags.allow_update }}'
