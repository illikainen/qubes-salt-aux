{% import 'aux/globals.j2' as globals %}

clipboard-policy:
  file.managed:
    - name: '/etc/qubes-rpc/policy/qubes.ClipboardPaste'
    - source: 'salt://aux/files/policy/qubes.ClipboardPaste'
    - template: 'jinja'
    - backup: False
    - context:
      clipboard_dst_tag: '{{ globals.tags.allow_clipboard_dst }}'
