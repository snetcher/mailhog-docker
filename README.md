# mailhog-docker
MailHog in a tiny Docker image powered by Alpine Linux

# How to use this image

Print help:

```bash
docker run --rm skilldlabs/mailhog --help
```
Run MailHog:

```bash
docker run -d --name=mailhog \
  -p 1025:1025 \
  -p 8025:8025 \
  skilldlabs/mailhog
```
Access to Web UI using your browser:

```bash
firefox http://localhost:8025
```
