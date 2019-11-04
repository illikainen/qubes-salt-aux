/rw/config/qubes.SshAgent:
  file.managed:
    - source: 'salt://aux/files/qubes-split-ssh/qubes.SshAgent.rpc'
    - backup: False

/rw/config/rc.local:
  file.append:
    - text: |
        test -e /etc/qubes-rpc/qubes.SshAgent || \
          ln -s /rw/config/qubes.SshAgent /etc/qubes-rpc/qubes.SshAgent
