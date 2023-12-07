docker compose up && docker compose rm -fs
rm /opt/ssl/*
cp letsencrypt/archive/auth-dev.max-paloma-babbie.xyz/* /opt/ssl/
