{% import 'aux/globals.j2' as globals %}

/rw/config/qubes-split-ssh.sh:
  file.managed:
    - source: 'salt://aux/files/qubes-split-ssh/qubes-split-ssh.sh'
    - context:
      user: '{{ globals.users.vm }}'
      domain: '@default'
    - template: 'jinja'
    - mode: 755
    - backup: False

/rw/config/rc.local:
  file.append:
    - text:
      - '/rw/config/qubes-split-ssh.sh'
