# vim: sts=2 ts=2 sw=2 et ai
#
# SET ALL PARAMS IN CONFIG SECTION USING UNDERSCORE, NOT HYPHEN
# so that it works correctly
{% set alertlogic_registration_key = salt['pillar.get']('alert_logic:registration_key', '') %}
# Must be a full https uri including port
{% set alertlogic_egress_url = False %}
{% set alertlogic_proxy_url = False %}
{% set alertlogic_for_autoscaling = False %}
{% set alertlogic_for_imaging = False %}
