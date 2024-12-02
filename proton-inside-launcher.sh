#!/usr/bin/env bash

if [[ ! -f "proton-launch-settings.sh" ]]; then
    game_id=$(kdialog --inputbox "Steam Game ID")
    app=$(kdialog --getopenfilename "Application")
    proton_version="Proton 9.0 (Beta)"
else
    source ./proton-launch-settings.sh
fi

echo -ne "game_id=\"$game_id\"\napp=\"$app\"\nproton_version=\"$proton_version\"" > ./proton-launch-settings.sh

cd "/home/deck/.steam/steam/steamapps/compatdata/$game_id/pfx/" || exit

STEAM_COMPAT_DATA_PATH="/home/deck/.steam/steam/steamapps/compatdata/$game_id" WINEPREFIX=$PWD \
STEAM_COMPAT_CLIENT_INSTALL_PATH="/home/deck/.steam/root/" \
    "/home/deck/.steam/root/steamapps/common/$proton_version/proton" run "$app"
