server {
  listen 80;
  server_name files.pedromaltez.com;
  root /srv/https/files.pedromaltez.com;
}

server {
  listen 80;
  server_name w.files.pedromaltez.com ww.files.pedromaltez.com www.files.pedromaltez.com wwww.files.pedromaltez.com;
  return 301 http://pedromaltez.com$request_uri;
  expires 1m;
}
