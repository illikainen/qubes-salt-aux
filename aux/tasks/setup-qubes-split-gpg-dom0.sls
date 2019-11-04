{% import 'aux/globals.j2' as globals %}

/etc/qubes-rpc/policy/qubes.Gpg:
  file.managed:
    - source: 'salt://aux/files/policy/qubes.Gpg'
    - context:
      domain: 'app-smartcard'
      gpg_tag: '{{ globals.tags.allow_gpg }}'
    - template: 'jinja'
    - backup: False
