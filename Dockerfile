FROM denoland/deno:2.3.3
WORKDIR /app
COPY --chown=deno:deno . .
RUN deno cache main.ts
EXPOSE 8000
HEALTHCHECK --interval=30s --timeout=10s --start-period=15s --retries=3 \
  CMD curl -f http://localhost:8000/ || exit 1
USER deno
CMD ["deno", "run", "--allow-net", "--allow-read", "--allow-env", "main.ts"]
