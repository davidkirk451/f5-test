delete_pool_member:
  bigip.delete_pool_member:
    - hostname: {{salt['pillar.get']('bigip_vars:HOST')}}
    - username: {{salt['pillar.get']('bigip_vars:USER')}}
    - password: {{salt['pillar.get']('bigip_vars:PASSWORD')}}
    - name: {{salt['pillar.get']('bigip_vars:POOL_NAME')}}
    - member: {{salt['pillar.get']('bigip_vars:POOL_MEMBER_NAME')}}:443
