#!/command/with-contenv bashio

declare camera_url

camera_url=$(bashio::config 'camera_url')

# sed -i "s/%%camera_url%%/${camera_url}/g" \
#     /etc/nginx/stream.conf