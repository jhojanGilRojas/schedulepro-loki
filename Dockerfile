FROM grafana/loki:3.5.1

# Copia la configuración personalizada
COPY loki-config.yaml /etc/loki/local-config.yaml

# Crea carpeta de datos con permisos adecuados
RUN mkdir -p /loki-data && chown -R nobody:nobody /loki-data

# Usa usuario sin privilegios
USER nobody

# Expone el puerto estándar de Loki
EXPOSE 3100

# Comando por defecto (puede sobreescribirse en Render)
CMD ["-config.file=/etc/loki/loki-config.yaml"]
