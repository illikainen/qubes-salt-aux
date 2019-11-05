{% import 'aux/globals.j2' as globals %}
{% set vmname = 'app-www' %}
{% set template = 'template-debian-10-www' %}

{{ vmname }}-vm:
  qvm.vm:
    - name: '{{ vmname }}'
    - present:
      - template: '{{ template }}'
      - label: 'red'
    - tags:
      - add:
        - '{{ globals.tags.allow_clipboard_dst }}'
