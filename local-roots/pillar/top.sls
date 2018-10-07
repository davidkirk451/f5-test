base:
  'G@id:webserver* and G@os_family:RedHat':
    - apache.beacons
    - f5-bigip
  'G@id:webserver* and G@os_family:Windows':
    - iis.beacons
    - f5-bigip
  'G@id:salt-master':
    - f5-bigip
