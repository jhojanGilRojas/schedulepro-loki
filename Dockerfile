FROM grafana/loki:3.5.1

# Copia tu archivo de configuración
COPY loki-config.yaml /etc/loki/local-config.yaml

# No usamos RUN ni creamos carpetas manualmente

USER nobody

ENTRYPOINT ["/usr/bin/loki", "-config.file=/etc/loki/local-config.yaml"]
