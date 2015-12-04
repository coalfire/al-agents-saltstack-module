{% from "al_agents/defaults.sls" import configure_options %}

include:
  - al_agents


configure_agent:
  cmd.run:
    - name: ./al-agent configure {{ configure_options }}
    - user: root
    - cwd: /etc/init.d
    - unless:
      - ls /var/alertlogic/etc/host_key.pem
