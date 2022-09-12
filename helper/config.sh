config() {
  echo -e "
  ╭──────────────────────────────────╮
  │  ${COG} Replace apache configuration  │
  ╰──────────────────────────────────╯
  "

  start_spinner "· Replace ${COLOR_WARNING}httpd.conf${COLOR_DEFAULT}"
  sleep 2s
  if cp httpd.conf $PREFIX/etc/apache2/httpd.conf; then
    stop_spinner $?
  else
    sleep 2
    cp "empty" > /dev/null 2>&1
    stop_spinner $?
  fi
}