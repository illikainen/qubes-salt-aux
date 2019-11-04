{% import 'aux/globals.j2' as globals %}

/etc/qubes-rpc/policy/qubes.SshAgent:
  file.managed:
    - source: 'salt://aux/files/qubes-split-ssh/qubes.SshAgent.policy'
    - context:
      domain: 'app-smartcard'
      ssh_agent_tag: '{{ globals.tags.allow_ssh_agent }}'
    - template: 'jinja'
    - backup: False
