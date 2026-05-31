FROM calciumion/new-api:latest
ENV TZ=Asia/Shanghai
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
  CMD wget -qO- http://localhost:3000/api/status | grep -q '"success":true' || exit 1
ENTRYPOINT ["/new-api", "--port", "3000", "--log-dir", "/app/logs"]
