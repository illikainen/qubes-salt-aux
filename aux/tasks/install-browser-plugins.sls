install-plugins:
  pkg.installed:
    - pkgs:
      - 'webext-https-everywhere'
      - 'webext-ublock-origin'
    - refresh: True

# Fix for #925337
/usr/share/webext/ublock-origin/manifest.json:
  file.replace:
    - backup: False
    - pattern: '[ ]+"incognito".*'
    - repl: ''
