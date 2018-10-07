bigip_vars:
  HOST: 192.168.1.10
  USER: api
  PASSWORD: u8j@IZ!^@xUZ%E5bEzVs
  POOL_NAME: Y

{% if grains['id'] == 'webserver-A' %}
  POOL_MEMBER_NAME: 192.168.1.30
{% elif grains['id'] == 'webserver-B' %}
  POOL_MEMBER_NAME: 192.168.1.31
{% elif grains['id'] == 'webserver-C' %}
  POOL_MEMBER_NAME: 192.168.1.32
{% elif grains['id'] == 'salt-master' %}
  MEMBERS:
    A: 192.168.1.30
    B: 192.168.1.31
    C: 192.168.1.32
  LOAD_BALANCING_MODE: round-robin
  VIRTUAL_SERVER_NAME: X
  VIRTUAL_SERVER_DESTINATION: 192.168.1.20:443
  VIRTUAL_SERVER_SOURCE_ADDR: 0.0.0.0/0
  VIRTUAL_SERVER_SOURCE_TRANS: automap
{% endif %}
