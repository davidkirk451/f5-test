install_pip:
  pkg.installed:
    - name: python2-pip

install_inotify:
  pip.installed:
    - name: pyinotify
    - require:
      - pkg: python2-pip
