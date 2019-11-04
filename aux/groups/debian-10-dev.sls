{% if salt.qvm.check('debian-10') %}
dom0:
  - aux.vm.template-debian-10-dev
  - aux.vm.app-dev-general
  - aux.vm.app-irc
vms:
  template-debian-10-dev:
    {% if rt.online %}
    - aux.tasks.install-dev-build
    - aux.tasks.install-dev-python
    - aux.tasks.install-dev-shell
    - aux.tasks.install-dev-utils
    - aux.tasks.install-irc
    - aux.tasks.install-security
    - aux.tasks.install-spelling
    - aux.tasks.install-utils
    {% endif %}
  app-dev-general:
    - aux.tasks.setup-qubes-split-gpg-src
    - aux.tasks.setup-qubes-split-ssh-src
  app-irc:
    - aux.tasks.setup-qubes-split-gpg-src
    - aux.tasks.setup-qubes-split-ssh-src
{% endif %}
