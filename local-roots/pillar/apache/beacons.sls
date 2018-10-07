beacons:
  service:
    - services:
        httpd:
          onchangeonly: True
    - disable_during_state_run: True
  inotify:
    - files:
        /etc/systemd/system/multi-user.target.wants/httpd.service:
          mask:
            - delete_self
    - disable_during_state_run: True
