#!/usr/bin/env ash

set -eu

docker volume create mw-config

docker run --rm \
  -v mw-config:/mw-config \
  -e MW_which_dvca \
  -e MW_environment \
  -e MW_middleware_url \
  -e MW_connector_metadata_url \
  -e MW_admin_password_hash \
  -e MW_ssl_cert \
  -e MW_ssl_key \
  -e MW_dvca_tls_cert \
  -e MW_dvca_tls_key \
  -e MW_saml_crypt_cert \
  -e MW_saml_crypt_key \
  -e MW_saml_signing_cert \
  -e MW_saml_signing_key \
  -e MW_db_url \
  -e MW_db_username \
  -e MW_db_password \
  govukverify/eidas-mw-config-generator:snowflake --env /mw-config

exec docker run --rm \
    --name eidas-middleware \
    --publish 8443:8443 \
    --mount src=mw-config,dst=/opt/eidas-middleware/configuration \
    govukverify/eidas-middleware:snowflake
