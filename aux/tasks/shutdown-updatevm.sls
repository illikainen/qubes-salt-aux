# Shutdown UpdateVM unless it's sys-firewall or sys-net to allow resetting
# disp-based updatevms.
{% set vmname = salt.cmd.run('qubes-prefs updatevm') %}

{{ vmname }}-shutdown:
  qvm.shutdown:
    - name: '{{ vmname }}'
    - flags:
      - wait
    - onlyif:
      - test '{{ vmname }}' != 'sys-firewall'
      - test '{{ vmname }}' != 'sys-net'
