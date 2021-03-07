#!/bin/bash

DIR=`cd $(dirname $0); pwd`

source $DIR/.lamp.var
source $DIR/.spinner/spinner.sh

banner
install
lamptable

function config() {

    echo -e "⚙️ Replace apache configuration\n"

    start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎ 📦 httpd.conf"
    sleep 2

    if cp httpd.conf $PREFIX/etc/apache2/httpd.conf; then
        stop_spinner $?
    else
        sleep 2
        cp "empty" > /dev/null 2>&1
        stop_spinner $?
    fi

    echo -e "\n⚙️ Creating htdocs directory on 
   $HOME/\n"

    start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎ 📦 /home/apache (htdocs)"
    sleep 2

    if [[ -d $HOME/apache ]]; then
        echo "<?php phpinfo(); ?>" >> $HOME/apache/index.php
        stop_spinner $?
    else
        mkdir $HOME/apache
        echo "<?php phpinfo(); ?>" >> $HOME/apache/index.php
        stop_spinner $?
    fi

    echo ""

}

config

function shortexec() {

    echo -e "⚙️ Creating shortcut LAMP on 
   $PREFIX/bin/\n"

    for bin in "${bins[@]}"; do

        start_spinner "‏‏‎‏‏‎ ‎‏‏‎ ‎ 📦 $bin"
        sleep 2

        cp $bin $PREFIX/bin/$bin

        if [[ -f $PREFIX/bin/$bin ]]; then
            stop_spinner $?
        else
            sleep 2
            cp "empty" > /dev/null 2>&1
            stop_spinner $?
        fi

    done

    echo ""

}

shortexec
runit

echo -e "⚠️ Restart Termux so that the service-daemon is started."
echo -e "⚠️ On first boot run 'lamp' to start service."
echo -e "⚠️ To check status web server run 'lamp-check' 
  (require start service first).\n"
