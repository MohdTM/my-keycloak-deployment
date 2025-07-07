# 1. Start from the official RH-SSO (Keycloak) image
FROM quay.io/keycloak/keycloak:26.0.7

# 2. Copy in your custom themes and providers
COPY themes/     /opt/keycloak/themes/
COPY providers/  /opt/keycloak/providers/

# 3. (Optional) Import any realm JSON you have under data/
#    e.g. data/myrealm.json → /opt/keycloak/data/import/
COPY data/*.json /opt/keycloak/data/import/

# 4. Expose the HTTP port
EXPOSE 8080

# 5. Launch in dev-mode (so your themes reload without restart), import realm if present
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--import-realm", "--http-enabled=true","--http-port=8080"]
