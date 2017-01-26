nginx config
============

Configuration files for my nginx server. Certificate generation depends on
[letsencrypt][] and [certbot][].


SSL Certificates
----------------
This repository includes two templates:
* [`letsencrypt-nginx-pre-auth-template`][] for before certificate generation
* [`letsencrypt-nginx-post-auth-template`][] for after certificate generation

To generate the certificates for a domain use the `pre-auth` template and enable
the domain.

    certbot --webroot -w example.com -d example.com

After the certificates have been created, change to the `post-auth` template.

### Updating certificates

Check that your certificates all renew properly:

    certbot renew --dry-run

Set up a cron or systemd job to renew the certificates twice a day.

    certbot renew --quiet --no-self-upgrade


Consult the [certbot documentation][] for up to date instructions.

[letsencrypt]: https://letsencrypt.org/
[certbot]: https://certbot.eff.org
[`letsencrypt-nginx-pre-auth-template`]: letsencrypt-nginx-pre-auth-template
[`letsencrypt-nginx-post-auth-template`]: letsencrypt-nginx-post-auth-template
[certbot documentation]: https://certbot.eff.org/docs/
