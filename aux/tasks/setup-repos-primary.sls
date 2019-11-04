{%- if grains['os'] == 'Debian' -%}
  {%- include 'aux/tasks/setup-repos-primary-debian.sls' -%}
{%- elif grains['os'] == 'Fedora' -%}
  {%- include 'aux/tasks/setup-repos-primary-fedora.sls' -%}
{%- endif -%}
