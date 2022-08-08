#!/usr/bin/env bash

HELPERS=(
    colors config cursor finish htdocs
    icon packages screen signal shortcutexec
    spinner stat switchcase
)

for HELPER in ${HELPERS[@]}; do
    source helper/${HELPER}.sh
done

# clear
printInfoPackages
# echo -e ""
# switchCase "Do you want to install" "packages" installPackages
# config
# htdocs
# shortcutexec