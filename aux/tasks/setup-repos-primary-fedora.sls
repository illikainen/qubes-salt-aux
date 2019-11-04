{% for conf in ['/etc/dnf/dnf.conf', '/etc/yum.conf'] %}
{{ conf }}-settings:
  ini.options_present:
    - name: '{{ conf }}'
    - strict: False
    - sections:
        main:
          gpgcheck: 1
          localpkg_gpgcheck: 1
          sslverify: 1
          skip_if_unavailable: 0
          strict: 1
          retries: 50
          timeout: 60
    - onlyif: test -e '{{ conf }}'
{% endfor %}

{% for repo in salt.cmd.run('ls -1 /etc/yum.repos.d/*.repo').splitlines() %}
{{ repo }}-baseurl-fedora:
  file.replace:
    - name: '{{ repo }}'
    - pattern: '^#[ \t]*baseurl[ \t]*=[ \t]*http://download\.fedoraproject\.org/'
    - repl: 'baseurl=https://dl.fedoraproject.org/ https://dl.fedoraproject.org/'
    - backup: False

{{ repo }}-baseurl-rpmfusion:
  file.replace:
    - name: '{{ repo }}'
    - pattern: '^#[ \t]*baseurl[ \t]*=[ \t]*http://download1\.rpmfusion\.org/'
    - repl: 'baseurl=https://download1.rpmfusion.org/'
    - backup: False

{{ repo }}-baseurl-https:
  file.replace:
    - name: '{{ repo }}'
    - pattern: '^[ \t]*baseurl[ \t]*=[ \t]*http://'
    - repl: 'baseurl=https://'
    - backup: False

{{ repo }}-no-metalink:
  file.replace:
    - name: '{{ repo }}'
    - pattern: '^[ \t]*metalink[ \t]*='
    - repl: '#metalink='
    - backup: False
{% endfor %}
