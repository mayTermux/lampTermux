#!/bin/bash

DIR=`cd $(dirname $0); pwd`

source $DIR/.spinner/spinner.sh

packages=(

    "php"
    "php-apache"
    "phpmyadmin"
    "mariadb"

)

function install() {

    echo -e "\n⚙️ Installing LAMP Package"

    for package in "${packages[@]}"; do

        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎📦 $package"
        pkg install -y $package &>/dev/null
        
        function check() {

            ipkg=$(pkg list-installed $package 2> /dev/null | tail -n 1)
            cpkg=${ipkg%/*}

            if [[ $cpkg == $package ]]; then
                stop_spinner $? || exit 1;
            else
                sleep 2
                cp "empty" > /dev/null 2>&1
                stop_spinner $?
                start_spinner "‎‎‏‏‎‏‏‎‏‏‎ ‎‏‏‎ ‎📦 ‎$fullpkg (retrying) ‎‏‏‎ "
                pkg install -y $package &>/dev/null
                check
            fi

        }

        check

    done

}

install
echo ""
