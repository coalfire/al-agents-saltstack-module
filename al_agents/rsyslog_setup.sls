{% from "al_agents/defaults.sls" import alertlogic_initscript with context %}

include:
  - al_agents
# {# {% if salt['cmd.run'] %} #}
rsyslog:
  service.running:
    - watch:
      - file: /etc/rsyslog.d/alertlogic.conf
    - onlyif:
      - ls /etc/init.d/{{ alertlogic_initscript }}

/etc/rsyslog.d/alertlogic.conf:
  file.managed:
    - source: salt://al_agents/files/rsyslog/alertlogic.conf
    - onlyif:
      - ls /etc/init.d/{{ alertlogic_initscript }}
