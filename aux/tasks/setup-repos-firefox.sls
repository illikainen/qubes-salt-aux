# Both Debian and Fedora seems quite slow to ship Firefox updates.  Ubuntu
# seems to be a lot quicker, so Debian templates using Firefox are turned into
# frankensteins by adding the main component from Ubuntu LTS.
{% if grains['os'] == 'Debian' %}
ubuntu-keyring:
  pkg.installed: []

/etc/apt/trusted.gpg.d/ubuntu-archive-keyring.gpg:
  file.symlink:
    - target: '/usr/share/keyrings/ubuntu-archive-keyring.gpg'

/etc/apt/sources.list.d/ubuntu.list:
  file.managed:
    - backup: False
    - contents: |
        deb https://ubuntu.ethz.ch/ubuntu bionic main
        deb https://ubuntu.ethz.ch/ubuntu bionic-updates main
        deb https://ubuntu.ethz.ch/ubuntu bionic-security main

        deb https://mirrors.dotsrc.org/ubuntu bionic main
        deb https://mirrors.dotsrc.org/ubuntu bionic-updates main
        deb https://mirrors.dotsrc.org/ubuntu bionic-security main

/etc/apt/preferences.d/99-ubuntu:
  file.managed:
    - backup: False
    - contents: |
        Package: *
        Pin: release o=Ubuntu
        Pin-Priority: -1

        Package: firefox
        Pin: release o=Ubuntu
        Pin-Priority: 1000
{% endif %}
