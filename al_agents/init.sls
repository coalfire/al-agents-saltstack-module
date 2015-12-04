{% from "al_agents/defaults.sls" import pkg_url with context %}


al-agent:
  pkg:
    - installed
    - sources:
      - al-agent: {{ pkg_url }}
  service:
    - running
    - required:
      - pkg.installed
    - enable: True
    - restart: True
    # - watch:
    #   - file: /var/alertlogic/etc/host_key.pem
