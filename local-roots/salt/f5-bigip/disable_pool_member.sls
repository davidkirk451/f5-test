disable_pool_member:
  bigip.modify_pool_member:
    - name: {{salt['pillar.get']('bigip_vars:POOL_NAME')}}
    - hostname: {{salt['pillar.get']('bigip_vars:HOST')}}
    - username: {{salt['pillar.get']('bigip_vars:USER')}}
    - password: {{salt['pillar.get']('bigip_vars:PASSWORD')}}
    - member: {{salt['pillar.get']('bigip_vars:POOL_MEMBER_NAME')}}:443
    - member_state: user-down
    - session: user-disabled
