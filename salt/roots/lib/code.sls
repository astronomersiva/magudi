{% macro code(name, code_rev, requirements_file) -%}
/opt/{{name}}:
  file.directory:
    - user: app
    - group: app

{{name}}_code:
  git.latest:
    - name: https://github.com/pythonindia/{{name}}.git
    - rev: {{code_rev}}
    - target: /opt/{{name}}
    - force_reset: True
    - user: app
    - require:
      - file: /opt/{{name}}

/opt/envs/{{name}}:
  virtualenv.managed:
    - system_site_packages: False
    - require:
      - git: {{name}}_code
      - pkg: virtualenv
      - file: uwsgi_dirs
    - user: app

{{name}}_pip_upgrade:
  pip.installed:
    - name: pip
    - upgrade: True
    - bin_env: /opt/envs/{{name}}
    - require:
      - virtualenv: /opt/envs/{{name}}
    - user: app

{{name}}_pip_requirements:
  pip.installed:
    - requirements: /opt/{{name}}/{{requirements_file}}
    - bin_env: /opt/envs/{{name}}
    - require:
      - pip: {{name}}_pip_upgrade
    - user: app
    - cwd: /opt/{{name}}/
{% endmacro %}
