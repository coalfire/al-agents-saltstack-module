{% from "al_agents/defaults.sls" import provision_options, for_imaging with context %}
{% from "al_agents/config.sls" import for_imaging with context %}

include:
  - al_agents
  - al_agents.configure_agent


{% if for_imaging == '' %}
provision_agent:
  cmd.run:
    - user: root
    - name: /etc/init.d/al-agent provision {{ provision_options }}
    - unless:
      - ls /var/alertlogic/etc/host_key.pem

al-agent-provision:
  module.run:
    - order: last
    - name: service.restart
    - m_name: al-agent
{% endif %}
