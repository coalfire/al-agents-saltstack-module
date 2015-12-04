# vim: sts=2 ts=2 sw=2 et ai
#
# SET ALL PARAMS IN CONFIG SECTION USING UNDERSCORE, NOT HYPHEN
# so that it works correctly
{% set registration_key = 'your_registration_key_here' %}
# Must be a full https uri including port
{% set egress_url = 'vaporator.alertlogic.com:443' %}
{% set proxy_url = '' %}
{% set for_autoscaling = '' %}
{% set for_imaging = '' %}