{% for node_name, ip in salt['pillar.get']('bigip_vars:MEMBERS', {}).iteritems() %}
{{ip}}:
  bigip.create_node:
    - name: {{ip}}
    - address: {{ip}}
    - hostname: {{salt['pillar.get']('bigip_vars:HOST')}}
    - username: {{salt['pillar.get']('bigip_vars:USER')}}
    - password: {{salt['pillar.get']('bigip_vars:PASSWORD')}}
{% endfor %}

bigip_create_pool_{{salt['pillar.get']('bigip_vars:POOL_NAME')}}:
  bigip.create_pool:
    - name: {{salt['pillar.get']('bigip_vars:POOL_NAME')}}
    - members:
      {% for node_name, ip in salt['pillar.get']('bigip_vars:MEMBERS', {}).iteritems() %}
      - {{ip}}:443
      {% endfor %}
    - description: {{salt['pillar.get']('bigip_vars:POOL_NAME')}} Pool
    - load_balancing_mode: {{salt['pillar.get']('bigip_vars:LOAD_BALANCING_MODE')}}
    - allow_nat: yes
    - allow_snat: yes
    - ignore_persisted_weight: disabled
    - ip_tos_to_client: pass-through
    - ip_tos_to_server: pass-through
    - link_qos_to_client: pass-through
    - link_qos_to_server: pass-through
    - min_active_members: 1
    - min_up_members: 1
    - min_up_members_action: restart-all
    - min_up_members_checking: disabled
    - monitor: https
    - profiles: none
    - queue_depth_limit: 0
    - queue_on_connection_limit: disabled
    - queue_time_limit: 1
    - reselect_tries: 1
    - service_down_action: none
    - slow_ramp_time: 1
    - hostname: {{salt['pillar.get']('bigip_vars:HOST')}}
    - username: {{salt['pillar.get']('bigip_vars:USER')}}
    - password: {{salt['pillar.get']('bigip_vars:PASSWORD')}}

bigip_create_virtual:
  bigip.create_virtual:
    - name: {{salt['pillar.get']('bigip_vars:VIRTUAL_SERVER_NAME')}}
    - description: {{salt['pillar.get']('bigip_vars:VIRTUAL_SERVER_NAME')}} Virtual Server
    - destination: {{salt['pillar.get']('bigip_vars:VIRTUAL_SERVER_DESTINATION')}}
    - pool: {{salt['pillar.get']('bigip_vars:POOL_NAME')}}
    - source_address_translation: {{salt['pillar.get']('bigip_vars:VIRTUAL_SERVER_SOURCE_TRANS')}}
    - source: {{salt['pillar.get']('bigip_vars:VIRTUAL_SERVER_SOURCE_ADDR')}}
    - address_status: yes
    - auto_lasthop: default
    - bwc_policy: none
    - cmp_enabled: yes
    - dhcp_relay: no
    - connection_limit: 1000
    - state: enabled
    - fallback_persistence: none
    - flow_eviction_policy: none
    - gtm_score: 10
    - ip_forward: no
    - ip_protocol: tcp
    - internal: no
    - mirror: disabled
    - nat64: disabled
    - persist: []
    - profiles: none
    - policies: none
    - rate_class: None
    - rules: none
    - related_rules: none
    - reject: no
    - source_port: change
    - state: enabled
    - traffic_classes: none
    - translate_address: enabled
    - translate_port: enabled
    - vlans: none
    - hostname: {{salt['pillar.get']('bigip_vars:HOST')}}
    - username: {{salt['pillar.get']('bigip_vars:USER')}}
    - password: {{salt['pillar.get']('bigip_vars:PASSWORD')}}
