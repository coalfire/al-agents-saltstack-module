Alert Logic Agent SLS
=================
This set of state files are used to install and configure the Alert Logic agent.

Requirements
------------

Supported OS
============
Debian 7 amd64/i386
RedHat 6 x86_64/i386
CentOS 6 x86_64/i386

Supported Sysloggers
====================
rsyslog
syslog-ng

Note: If you are using a syslog other than the above you need to configure it to send logs to tcp 1514
Note: If you are using a deriavite of SaltStack's rsyslog formula and using pillars, add salt://al_agents/files/rsyslog/alertlogic.conf to the custom section


Attributes
----------

* `registration_key:` - your required registration key. String defaults to `your_registration_key_here`
* `for_autoscaling` - The for_autoscaling attribute determines if your installation will be configured as a `host` or `role` server.  By default for_autoscaling is set to `false` or in other words as a `host` install.  If autoscaling is set to `True` then the install is configured as a `role` server. Boolean defaults to `false`
* `for_imaging` - The `for_imaging` attribute determines if the install process will continue or stop prior to provisioning.  If the `for_imaging` attribute is set to `true` then the install process perform an install only and stop before provisioning.  This allows for instance snapshots to be saved and started for later use.  With this attribute set to `False` then the provisioning process is performed during setup.  Boolean defaults to `false`
* `egress_url` - By default all traffic is sent to vaporator.alertlogic.com:443.  This attribute is useful if you have a machine that is responsible for outbound traffic (NAT box).  If you specify your own URL ensure that it is a properly formatted URI.  String defaults to `vaporator.alertlogic.com:443`
* `proxy_url` - By default al-agent does not require the use of a proxy.  This attribute is useful if you want to avoid a single point of egress.  When a proxy is used, both `egress_url` and `proxy_url` values are required.  If you specify a proxy URL ensure that it is a properly formatted URI.  String defaults to `nil`

#### Installing from GitHub
1. Clone the repo
2. Symlink from al_agents to root of salt


Available states
================

.. contents::
    :local:

``al_agents``
----------

Installs the AL-agent package and starts the service.

``al_agents.configure_agent``
----------

Installs, configures al-agent

``al_agents.provision_agent``
----------

Installs, configures, and provision agent

``al_agents.rsyslog_setup``
----------

Installs, al-agent and configure rsyslog. Does detection based on init script.

``al_agents.syslog_ng_setup``
----------

Installs, al-agent and configure syslog-ng. Does detection based on init script.

``al_agents.full``
----------

Wrapper doing a include on configure_logger and provision_agent


``al_agents.configure_logger``
----------

Sets up the syslogger to handle logging. Does detection based on init script.

``al_agents.configure_selinux``
----------

Configure selinux context on tcp 1514

``al_agents.send_test_log``
-----------

Sends a test log to ensure everything is working

