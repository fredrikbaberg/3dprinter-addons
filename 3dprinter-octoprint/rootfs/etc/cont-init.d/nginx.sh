#!/usr/bin/with-contenv bashio
# ==============================================================================
# Add-on: 3dprinter-octoprint
# Configures NGINX
# ==============================================================================

# Generate Ingress configuration
bashio::var.json \
    interface "$(bashio::addon.ip_address)" \
    port "^$(bashio::addon.ingress_port)" \
    ingress_entry "$(bashio::addon.ingress_entry)" \
    camera_host "$(bashio::config 'camera_url')" \
    | tempio \
        -template /etc/nginx/templates/ingress.gtpl \
        -out /etc/nginx/servers/ingress.conf

# Generate direct access configuration, if enabled.
if bashio::var.has_value "$(bashio::addon.port 5000)"; then
    bashio::var.json \
        interface "$(bashio::addon.ip_address)" \
        port "^$(bashio::addon.port 5000)" \
        | tempio \
            -template /etc/nginx/templates/direct.gtpl \
            -out /etc/nginx/servers/direct.conf
fi
