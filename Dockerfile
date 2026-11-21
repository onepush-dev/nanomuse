# nanoMuse on Railway: the official ghcr.io/nano-muse/nanomuse:1.0.9 image (GPL-3.0-or-later), code unmodified.
# Railway layer: everything lives on one volume at /data (memory, goals, vault, threads and the
# agent's workspace at /data/workspace). Railway mounts volumes as root, so a tiny start script
# fixes ownership and then drops to the image's own `muse` user (uid 1000) before `nanomuse serve`.
FROM ghcr.io/nano-muse/nanomuse:1.0.9
LABEL org.opencontainers.image.source="https://github.com/onepush-dev/nanomuse"
USER root
COPY railway/start.sh /railway-start.sh
RUN chmod +x /railway-start.sh
ENV NANOMUSE_DATA_DIR=/data \
    NANOMUSE_WORKSPACE=/data/workspace \
    NANOMUSE_SERVER_HOST=0.0.0.0 \
    NANOMUSE_SERVER_PORT=8080 \
    NANOMUSE_LLM_PROVIDER=openai \
    NANOMUSE_LLM_BASE_URL=https://api.deepseek.com \
    NANOMUSE_LLM_MODEL=deepseek-flash
EXPOSE 8080
ENTRYPOINT ["/railway-start.sh"]
CMD ["serve", "--host", "0.0.0.0", "--no-qr"]
