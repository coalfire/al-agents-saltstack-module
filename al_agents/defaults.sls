{% from "al_agents/config.sls" import registration_key, egress_url, proxy_url, port, for_autoscaling, for_imaging with context %}

# Setting variables for provisioning of the agent
{% if registration_key != '' or registration_key != 'your_registration_key_here' %}
  {% set regoptions = ' --key ' ~ registration_key %}
{% endif %}

{% if for_autoscaling != '' %}
  {% set typeoptions = '--inst-type role' %}
{% else %}
  {% set typeoptions = '--inst-type host' %}
{% endif %}

{% set provision_options = typeoptions ~ regoptions %}

# Setting variables for configuring the agent
{% if proxy_url != '' %}
  {% set proxyoptions = ' --proxy ' ~ proxy_url %}
{% else %}
  {% set proxyoptions = '' %}
{% endif %}

{% if egress_url != '' %}
  {% set hostoptions = '--host ' ~ egress_url %}
{% else %}
  {% set hostoptions = '' %}
{% endif %}

{% set configure_options = hostoptions ~ proxyoptions %}

# Set up the download url based on system information
{% set base_url = 'https://scc.alertlogic.net' %}
{% if (grains['os_family'] == 'Debian') %}
  {% set pkg_name_prefix = 'al-agent_LATEST_' %}
  {% set initscript = 'rsyslog' %}
  {% set pkg_name_arch = 'amd64' %}
  {% set pkg_name_ext = 'deb' %}
  {% set syslog_ng_source = 's_src' %}
{% elif (grains['os_family'] == 'RedHat') %}
  {% set pkg_name_prefix = 'al-agent-LATEST-1.' %}
  {% set initscript = 'rsyslog' %}
  {% set pkg_name_arch = grains['cpuarch'] %}
  {% set pkg_name_ext = 'rpm' %}
  {% if grains['osmajorrelease'] >= 6 %}
    {% set syslog_ng_source = 's_all' %}
  {% elif grains['osmajorrelease'] < 6 %}
    {% set syslog_ng_source = 's_sys' %}
  {% endif %}
{% endif %}

{% set pkg_url = base_url ~ '/software/' ~ pkg_name_prefix ~ pkg_name_arch ~ '.' ~ pkg_name_ext %}
