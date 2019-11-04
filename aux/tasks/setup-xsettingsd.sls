/etc/xdg/xsettingsd:
  file.managed:
    - source: 'salt://aux/files/xsettingsd'
    - create: False
    - backup: False

/home/user/.xsettingsd:
  file.managed:
    - source: 'salt://aux/files/xsettingsd'
    - create: False
    - backup: False
