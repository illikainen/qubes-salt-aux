debian-list:
  file.managed:
    - name: '/etc/apt/sources.list'
    - backup: False
    - contents: |
        # ftp.ch.debian.org$
        deb https://debian.ethz.ch/debian {{ grains["oscodename"] }} main contrib non-free
        deb https://debian.ethz.ch/debian {{ grains["oscodename"] }}-updates main contrib non-free
        deb https://debian.ethz.ch/debian-security {{ grains["oscodename"] }}/updates main contrib non-free

        # ftp.dk.debian.org$
        deb https://mirrors.dotsrc.org/debian {{ grains["oscodename"] }} main contrib non-free
        deb https://mirrors.dotsrc.org/debian {{ grains["oscodename"] }}-updates main contrib non-free
        deb https://mirrors.dotsrc.org/debian-security {{ grains["oscodename"] }}/updates main contrib non-free

qubes-list:
  file.managed:
    - name: '/etc/apt/sources.list.d/qubes-r4.list'
    - backup: False
    - contents: |
        deb [arch=amd64] https://deb.qubes-os.org/r4.0/vm {{ grains["oscodename"] }} main
