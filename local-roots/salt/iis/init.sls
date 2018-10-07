IIS-WebServerRole:
  win_servermanager.installed:
    - recurse: True
    - name: Web-Server

default-ssl-website-https-binding:
  win_iis.create_binding:
    - site: 'Default Web Site'
    - ipaddress: '*'
    - port: 443
    - protocol: https
    - require:
      - win_servermanager: IIS-WebServerRole

# TODO: automate cert binding
# default-website-cert-binding:
#   win_iis.create_cert_binding:
#     - name: {{salt['pillar.get']('iis_certs:DEFAULT-CERT-THUMBPRINT')}}
#     - site: 'Default Web Site'
