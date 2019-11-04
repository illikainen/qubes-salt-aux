upgrade:
  pkg.uptodate:
    - refresh: True
{% if grains['os_family'] == 'Debian' %}
    - dist_upgrade: True
{% endif %}
