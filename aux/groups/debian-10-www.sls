{% if salt.qvm.check('debian-10') %}
dom0:
  - aux.vm.template-debian-10-www
  - aux.vm.dvm-debian-10-www
  - aux.vm.app-www
vms:
  template-debian-10-www:
    {% if rt.online %}
    - aux.tasks.setup-repos-firefox
    - aux.tasks.install-browser-plugins
    - aux.tasks.install-firefox
    - aux.tasks.install-fonts
    - aux.tasks.install-spelling
    - aux.tasks.install-utils
    {% endif %}
{% endif %}
