# --check führt nur prüfungen durch
# auf beiden data files muss in der datei pg_hba.conf die stellen
# IPv4 local connections:
#host    all             all             127.0.0.1/32            trust
# IPv6 local connections:
#host    all             all             ::1/128                 trust
#auf trust gestellt werden
"C:/Program Files/PostgreSQL/9.4/bin/pg_upgrade" --old-bindir "C:/Program Files/PostgreSQL/9.3/bin" --new-bindir "C:/Program Files/PostgreSQL/9.4/bin"  --old-datadir "C:\Users\claube\Google Drive\PostresSQL" --new-datadir "C:\Users\claube\Google Drive\PostresSQL94" --verbose --username=postgres