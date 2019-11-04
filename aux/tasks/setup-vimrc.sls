/etc/vim/vimrc.local:
  file.managed:
    - source: 'salt://aux/files/vimrc'
    - makedirs: True

{% if grains['os_family'] == 'RedHat' %}
/etc/vimrc:
  file.append:
    - text:
      - 'source /etc/vim/vimrc.local'
{% endif %}
