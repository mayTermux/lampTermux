logError() {
    echo -e "  ${COLOR_DANGER}${1}${COLOR_RESET}: ${COLOR_BOLD_WHITE}${2}${COLOR_RESET}"
    echo -e "\n  ${COLOR_DANGER}×${COLOR_RESET}  ${3}"
    echo -e "  ${COLOR_DANGER}╰>${COLOR_RESET} ${4}"
}