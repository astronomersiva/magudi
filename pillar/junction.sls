junction:
  server_config:
    port: 8902
    module: wsgi
  db:
    user: junction
    password: junction
    name: junction
  email_host_password: dummy
  admins:
    Test Me: test@sample.fake # add your email for testing.
  revs:
    junction: master
    pycon2015: master
  host: pycon.local.org:8080
  google_analytics_id: UA-XXXXXXX-1
  qr_codes_dir: /opt/junction/qr_codes/
  explara_api_token: abcd

service:
  name: junction
