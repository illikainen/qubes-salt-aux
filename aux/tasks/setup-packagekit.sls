/etc/PackageKit/CommandNotFound.conf:
  file.replace:
    - pattern: '^SoftwareSourceSearch=true'
    - repl: 'SoftwareSourceSearch=false'
    - append_if_not_found: true
    - ignore_if_missing: true
    - backup: False
