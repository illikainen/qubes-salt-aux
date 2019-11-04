{% if grains['os_family'] == 'Debian' %}
/etc/X11/Xresources/misc:
  file.managed:
    - source: 'salt://aux/files/xresources'
    - makedirs: True
    - backup: False
{% elif grains['os_family'] == 'RedHat' %}
/etc/X11/Xresources.local:
  file.managed:
    - source: 'salt://aux/files/xresources'
    - backup: False

/etc/X11/xinit/xinitrc.d/99-xresources-local.sh:
  file.managed:
    - contents: |
        #!/bin/sh
        xrdb -merge /etc/X11/Xresources.local
{% endif %}
