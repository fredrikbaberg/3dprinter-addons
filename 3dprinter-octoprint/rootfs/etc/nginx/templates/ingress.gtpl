server {
    listen {{ .interface }}:{{ .port }} default_server;

    include /etc/nginx/includes/server_params.conf;
    include /etc/nginx/includes/proxy_params.conf;

    location {{ .ingress_entry }} {
        allow   172.30.32.2;
        deny    all;

        proxy_pass http://backend;
        proxy_set_header X-Script-Name {{ .ingress_entry }}
    }
}
