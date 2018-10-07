{% if data[data['service_name']]['running'] == False %}
ensure_service_running:
  local.service.start:
    - tgt: {{ data['id'] }}
    - arg:
      - {{ data['service_name'] }}

enable_pool_member:
  local.state.apply:
    - tgt: {{ data['id'] }}
    - arg:
      - f5-bigip.enable_pool_member

{% elif data[data['service_name']]['running'] == True %}
ensure_service_enabled:
  local.service.enable:
    - tgt: {{ data['id'] }}
    - arg:
      - {{ data['service_name'] }}
{% endif %}
