{% import 'aux/globals.j2' as globals %}

/rw/config/gpg-split-domain:
  file.managed:
    - contents:
      - 'app-smartcard'
    - backup: False
