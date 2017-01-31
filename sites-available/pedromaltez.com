server {
  listen 443 ssl;
  server_name pedromaltez.com;
  root /srv/https/pedromaltez.com/public;
  ssl_certificate /etc/letsencrypt/live/pedromaltez.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/pedromaltez.com/privkey.pem;
  try_files $uri $uri.html $uri/ $uri/index.html =404;
  error_page 403 =404 /404.html;
  location = /404.html {
    internal;
  }
  if ($request_uri ~* "/index.html") {
    rewrite (?i)^(.*)index\.html$ $1 permanent;
  }
}

server {
  listen 80;
  listen 443 ssl;
  server_name w.pedromaltez.com ww.pedromaltez.com www.pedromaltez.com wwww.pedromaltez.com;
  ssl_certificate /etc/letsencrypt/live/pedromaltez.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/pedromaltez.com/privkey.pem;
  return 301 https://pedromaltez.com$request_uri;
  expires 1m;
}

# must be separate from above or it will cause a redirect loop
server {
  listen 80;
  server_name pedromaltez.com;
  return 301 https://pedromaltez.com$request_uri;
  expires 1m;
}
