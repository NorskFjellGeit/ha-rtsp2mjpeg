#!/command/with-contenv bashio

declare camera_width
declare camera_height
declare camera_fps
declare camera_still_fps

camera_width=$(bashio::config 'camera_width')
camera_height=$(bashio::config 'camera_height')
camera_fps=$(bashio::config 'camera_fps')
camera_still_fps=$(bashio::config 'camera_still_fps')


sed -i "s/%%camera_width%%/${camera_width}/g" \
    /etc/ffserver.conf

sed -i "s/%%camera_height%%/${camera_height}/g" \
    /etc/ffserver.conf

sed -i "s/%%camera_fps%%/${camera_fps}/g" \
    /etc/ffserver.conf

sed -i "s/%%camera_still_fps%%/${camera_still_fps}/g" \
    /etc/ffserver.conf