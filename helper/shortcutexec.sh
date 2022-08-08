#!/usr/bin/env bash

BINS=(
    lamp
    lamp-check
)

shortcutexec() {
  echo -e "
  ╭────────────────────────────╮
  │  ${COG} Creating shortcut LAMP  │
  ╰────────────────────────────╯
  "

  for BIN in ${BINS[@]}; do
    start_spinner "· Creating ${COLOR_WARNING}/bin/${BIN}${COLOR_DEFAULT}"
    sleep 2s

    # cp ${BIN} $PREFIX/bin/${BIN}

    if [ -f $PREFIX/bin/${BIN} ]; then
        stop_spinner $?
    else
        stop_spinner $?
    fi
  done
}