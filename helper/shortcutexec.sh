BINS=(
    lamp
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

    cp bin/${BIN} $PREFIX/bin/${BIN}
    chmod 755 $PREFIX/bin/${BIN}
    
    if [ -f $PREFIX/bin/${BIN} ]; then
        stop_spinner $?
    else
        stop_spinner $?
    fi
  done
}