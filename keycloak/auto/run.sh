# Variables de configuración
KEYCLOAK_URL="https://auth-dev.max-paloma-babbie.xyz"
REALM="UPTC2-DEV"
CLIENT_ID="nuevo-cliente"
CLIENT_SECRET="secreto-seguro"
REDIRECT_URIS=["*"]

# Solicitar un token de administrador
ADMIN_TOKEN=$(curl \
  -d "client_id=gabe" \
  -d "username=admin" \
  -d "password=palomaabbie" \
  -d "grant_type=password" \
  "$KEYCLOAK_URL/realms/master/protocol/openid-connect/token" | jq -r .access_token)

echo  $ADMIN_TOKEN
echo ---------------------
curl -X POST "$KEYCLOAK_URL/admin/realms/$REALM/clients" \
  -H "Authorization: Bearer $ADMIN_TOKEN" \
  -H "Content-Type: application/json" \
  --data '{
    "clientId": "lola",
    "protocol": "openid-connect",
  }'
