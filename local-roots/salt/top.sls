base:
  'G@id:webserver* and G@os_family:RedHat':
    - apache
    - apache.mod_ssl
    - www-files
    - pyinotify
  'G@id:webserver* and G@os_family:Windows':
    - iis
    - www-files
  'G@id:salt-master*':
    - f5-bigip
