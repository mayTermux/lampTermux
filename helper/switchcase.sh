switchCase() {

  setCursor on

  read -p "  ${1} ${2}? [Y/n] " SWITCH_CASE

  case "$SWITCH_CASE" in

    "" )
      ${3}
    ;;

    y|Y )
      ${3}
    ;;

    n|N )
      logError "\n\n  error" "" "" "Abort."
      exit 1
    ;;

    * )
      logError "\n\n  error" "Uknown answer '${SWITCH_CASE}'" "" "Please input the correct answer"
      exit 1
    ;;

  esac

}