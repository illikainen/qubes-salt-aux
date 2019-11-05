{% import_json 'aux/runtime.json' as rt %}
{% if rt.group %}
  {% import_yaml 'aux/groups/' + rt.group + '.sls' as group with context %}
  {% set dom0 = group and group.get('dom0') or [] %}
  {% set vms = group and group.get('vms') or {} %}
{% else %}
  {% set dom0 = [] %}
  {% set vms = {} %}
{% endif %}

base:
  dom0:
    # Base tasks.
    - aux.tasks.shutdown-updatevm
    - aux.tasks.setup-qubes-clipboard
    - aux.vm.disp-updates

    # Per-group tasks.
    {% for task in dom0 %}
    - '{{ task }}'
    {% endfor %}

  # Per-group targets.
  {% for name, tasks in vms.items() %}
  '{{ name }}':
    # Base tasks.
    {% if name.startswith('template') or name.startswith('standalone') %}
    - aux.tasks.setup-repos-primary
    - aux.tasks.setup-gitconfig
    - aux.tasks.setup-vimrc
    - aux.tasks.setup-terminal
    - aux.tasks.setup-xsettingsd
    - aux.tasks.setup-xresources
      {% if rt.online %}
    - aux.tasks.install-upgrades
    - aux.tasks.install-base
    - aux.tasks.install-firmware
    - aux.tasks.purge-firefox-esr
      {% endif %}
    {% endif %}

    # Per-target tasks.
    {% for task in tasks or [] %}
    - '{{ task }}'
    {% endfor %}
  {% endfor %}
