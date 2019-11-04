{% set name = 'app-vault' %}
{% set template = 'template-debian-10' %}

{{ name }}:
  qvm.vm:
    - name: '{{ name }}'
    - present:
      - template: '{{ template }}'
      - label: 'purple'
    - prefs:
      - netvm:
