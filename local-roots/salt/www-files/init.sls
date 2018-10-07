{% from "apache/map.jinja" import apache with context %}

{% if grains['os_family'] == 'Windows' %}
copy index file to the web server:
  file.managed:
    - name: C:\inetpub\wwwroot\index.html
    - source: salt://www-files/html/index.html.jinja
    - template: jinja
    - win_owner: SYSTEM
    - require:
      - win_servermanager: IIS-WebServerRole

{% elif grains['os_family'] == 'RedHat' %}

copy index file to the web server:
  file.managed:
    - name: {{ apache.wwwdir }}/html/index.html
    - source: salt://www-files/html/index.html.jinja
    - user: {{ apache.group }}
    - group: {{ apache.user }}
    - mode: 644
    - makedirs: true
    - template: jinja
    - require:
      - pkg: apache
{% endif %}
