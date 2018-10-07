/etc/salt/proxy:
  file.managed:
    - source: salt://proxy-minion/proxy
    - user: root
    - group: root
    - file_mode: 644
    - makedirs: True
