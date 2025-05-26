# Usa imagen oficial de Loki
FROM grafana/loki:3.5.1

# Copia tu archivo de configuración personalizado
COPY loki-config.yaml /etc/loki/local-config.yaml

# Crea carpetas seguras (Render permite escribir en /tmp o /etc/loki subdirs)
RUN mkdir -p /etc/loki/data && chown -R nobody:nobody /etc/loki/data

# Usa el usuario 'nobody' (como lo hace Loki por defecto)
USER nobody

# Comando por defecto (Render usa este CMD para iniciar el servicio)
ENTRYPOINT ["/usr/bin/loki", "-config.file=/etc/loki/local-config.yaml"]
