#!/bin/bash

HELPERS=(
    colors config cursor finish htdocs
    icon log packages shortcutexec
    signal spinner switchcase
)

for HELPER in ${HELPERS[@]}; do
    source helper/${HELPER}.sh
done

printInfoPackages
echo -e ""
switchCase "Do you want to install" "packages" installPackages
config
htdocs
shortcutexec
finish