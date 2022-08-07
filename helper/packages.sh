#!/usr/bin/env bash

PACKAGES=(
    php-apache mariadb
    php phpmyadmin
)

printInfoPackages() {

  KB_DOWNLOAD_SIZE=0
  MB_DOWNLOAD_SIZE=0

  KB_INSTALLED_SIZE=0
  MB_INSTALLED_SIZE=0

    echo -e "
  ╭─ LAMP Packages ─────────────────────────────────────────────────╮"
  echo -e "  │                                                                 │"
  printf "  │    %-10s    %-10s    %-13s    %-14s  │\n" "Name" "Version" "Download Size" "Installed Size"
  printf "  │    %-10s    %-10s    %-13s    %-14s  │\n" "──────────" "──────────" "─────────────" "──────────────"

    for PACKAGE in ${PACKAGES[@]}; do

        PACKAGE_NAME=$(apt show $PACKAGE 2> /dev/null | grep Package: | awk '{print $2}')
        VERSION=$(apt show $PACKAGE 2> /dev/null | grep Version: | awk '{print $2}')
        DOWNLOAD_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Download-Size: | awk '{print $2}')
        INSTALLED_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Installed-Size: | awk '{print $2}')

        UNIT_DOWNLOAD_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Download-Size: | awk '{print $3}')
        UNIT_INSTALLED_SIZE=$(apt show $PACKAGE 2> /dev/null | grep Installed-Size: | awk '{print $3}')

        printf "  │  · %-10s    %-10s    %-4s %-2s          %-4s %-2s         │\n" $PACKAGE_NAME $VERSION $DOWNLOAD_SIZE $UNIT_DOWNLOAD_SIZE $INSTALLED_SIZE $UNIT_INSTALLED_SIZE

        if [[ "${UNIT_DOWNLOAD_SIZE}" == "kB" && "${UNIT_INSTALLED_SIZE}" == "MB" ]]; then

            KB_DOWNLOAD_SIZE=$(echo "${KB_DOWNLOAD_SIZE} + ${DOWNLOAD_SIZE} / 1024" | bc -l | xargs -i printf "%'.1f" {})
            MB_INSTALLED_SIZE=$(echo "${MB_INSTALLED_SIZE} + ${INSTALLED_SIZE}" | bc -l | xargs -i printf "%'.1f" {})

        elif [[ "${UNIT_DOWNLOAD_SIZE}" == "MB" && "${UNIT_INSTALLED_SIZE}" == "kB" ]]; then

            MB_DOWNLOAD_SIZE=$(echo "${MB_DOWNLOAD_SIZE} + ${DOWNLOAD_SIZE}" | bc -l | xargs -i printf "%'.1f" {})
            KB_INSTALLED_SIZE=$(echo "${KB_INSTALLED_SIZE} + ${INSTALLED_SIZE} / 1024" | bc -l | xargs -i printf "%'.1f" {})

        elif [[ "${UNIT_DOWNLOAD_SIZE}" == "kB" && "${UNIT_INSTALLED_SIZE}" == "kB" ]]; then

            KB_DOWNLOAD_SIZE=$(echo "${KB_DOWNLOAD_SIZE} + ${DOWNLOAD_SIZE} / 1024" | bc -l | xargs -i printf "%'.1f" {})
            KB_INSTALLED_SIZE=$(echo "${KB_INSTALLED_SIZE} + ${INSTALLED_SIZE} / 1024" | bc -l | xargs -i printf "%'.1f" {})

        elif [[ "${UNIT_DOWNLOAD_SIZE}" == "MB" && "${UNIT_INSTALLED_SIZE}" == "MB" ]]; then

            MB_DOWNLOAD_SIZE=$(echo "${MB_DOWNLOAD_SIZE} + ${DOWNLOAD_SIZE}" | bc -l | xargs -i printf "%'.1f" {})
            MB_INSTALLED_SIZE=$(echo "${MB_INSTALLED_SIZE} + ${INSTALLED_SIZE}" | bc -l | xargs -i printf "%'.1f" {})

        fi

    done

    TOTAL_DOWNLOAD_SIZE=$(echo "${KB_DOWNLOAD_SIZE} + ${MB_DOWNLOAD_SIZE}" | bc -l | xargs -i printf "%'.1f" {})
    TOTAL_INSTALLED_SIZE=$(echo "${KB_INSTALLED_SIZE} + ${MB_INSTALLED_SIZE}" | bc -l | xargs -i printf "%'.1f" {})

    echo -e "  │                                                                 │"
    echo -e "  ╰─────────────────────────────────────────────────────────────────╯\n"
    echo -e "                                     ╭─ TOTAL ──────────────────────╮          "
    echo -e "                                     │  · Download Size: ${COLOR_SUCCESS}${TOTAL_DOWNLOAD_SIZE}${COLOR_DEFAULT} MB    │            "
    echo -e "                                     │  · Installed Size: ${COLOR_WARNING}${TOTAL_INSTALLED_SIZE}${COLOR_DEFAULT} MB  │           "
    echo -e "                                     ╰──────────────────────────────╯          "
}

installPackages() {
    echo -e "
  ╭───────────────────────╮
  │  Installing Packages  │
  ╰───────────────────────╯
  "

  for PACKAGE in "${PACKAGES[@]}"; do
    start_spinner "· Installing ${COLOR_WARNING}${PACKAGE}${COLOR_DEFAULT}"

    pkg i -y ${PACKAGE} &>/dev/null
    THIS_PACKAGE=$(pkg list-installed $PACKAGE 2> /dev/null | tail -n 1)
    CHECK_PACKAGE=${THIS_PACKAGE%/*}

    if [[ $CHECK_PACKAGE == $PACKAGE ]]; then

      stop_spinner $? || exit 1

    else

      stop_spinner $?

    fi
  done
}

# source animation.sh
source spinner.sh
source switchcase.sh
source cursor.sh
source colors.sh
source stat.sh
clear
printInfoPackages
echo -e ""
switchCase "Do you want to install" "packages" installPackages
