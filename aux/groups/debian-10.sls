{% if salt.qvm.check('debian-10') %}
dom0:
  - aux.vm.template-debian-10
  - aux.vm.dvm-debian-10
  - aux.vm.app-keys
  - aux.vm.app-smartcard
  - aux.vm.app-vault
  - aux.tasks.setup-qubes-split-gpg-dom0
  - aux.tasks.setup-qubes-split-ssh-dom0
vms:
  template-debian-10:
  app-smartcard:
    - aux.tasks.setup-qubes-split-ssh-dst
{% endif %}
