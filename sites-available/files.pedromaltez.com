server {
  listen 80;
  server_name files.pedromaltez.com;
  root /srv/https/files.pedromaltez.com;
}
