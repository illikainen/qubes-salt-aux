install-firefox:
  pkg.installed:
    - pkgs:
      - 'firefox'
    - refresh: True

{% if grains['os_family'] == 'Debian' %}
/etc/firefox/syspref.js:
  file.managed:
    - source: 'salt://aux/files/firefox.js'
{% endif %}
