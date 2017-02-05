server {
  listen 443 ssl;
  server_name files.pedromaltez.com;
  root /srv/https/files.pedromaltez.com/public;
  ssl_certificate /etc/letsencrypt/live/files.pedromaltez.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/files.pedromaltez.com/privkey.pem;
}

# must be separate from above or it will cause a redirect loop
server {
  listen 80;
  server_name files.pedromaltez.com;
  return 301 https://files.pedromaltez.com$request_uri;
  expires 1m;
}
