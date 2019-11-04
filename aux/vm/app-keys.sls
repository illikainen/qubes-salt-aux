{% set name = 'app-keys' %}
{% set template = 'template-debian-10' %}

{{ name }}:
  qvm.vm:
    - name: '{{ name }}'
    - present:
      - template: '{{ template }}'
      - label: 'purple'
    - prefs:
      - netvm:
