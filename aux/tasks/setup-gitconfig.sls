gitconfig-global:
  file.managed:
    - backup: False
    - contents: |
        [http]
        sslVerify = true

        [fetch]
        fsckObjects = true

        [receive]
        fsckObjects = true

        [transfer]
        fsckObjects = true
    - name: /etc/gitconfig
