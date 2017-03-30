include:
  - mariadb.config

{% from "mariadb/defaults.yaml" import rawmap with context %}
{%- set mariadb = salt['grains.filter_by'](rawmap, grain='os', merge=salt['pillar.get']('mariadb:lookup')) %}

mariadb:
  pkg.installed:
    - name: {{ mariadb.client }}
