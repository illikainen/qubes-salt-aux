install-security:
  pkg.installed:
    - pkgs:
      - 'checksec'
      - 'debian-security-support'
      - 'debsecan'
      - 'needrestart'

block-debsecan-cron:
  file.managed:
    - backup: False
    - contents: |
        # This file is meant to block /usr/sbin/debsecan-create-cron
    - name: '/etc/cron.d/debsecan'
