/usr/share/applications/qubes-run-terminal.desktop:
  file.replace:
    - pattern: '^Exec=.*'
    - repl: 'Exec=xterm'
    - backup: False
