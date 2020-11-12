# ------------------------------------------------------------------------------
# Description
# -----------
#
# proxychains will be inserted before the command
# modified from sudo plugin
# ------------------------------------------------------------------------------
# Authors
# -------
#
# * zhaoxinwei <zhaoxinwei74@gmail.com>
#
# ------------------------------------------------------------------------------

proxychains-command-line() {
    [[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)"

    # Save beginning space
    local WHITESPACE=""
    if [[ ${LBUFFER:0:1} = " " ]]; then
        WHITESPACE=" "
        LBUFFER="${LBUFFER:1}"
    fi

    # Get the first part of the typed command and check if it's proxychains
    # If so, do nothing
    # If else, add the proxychains buffer

    if [[ $BUFFER != proxychains\ * ]]; then
        LBUFFER="proxychains $LBUFFER"
    fi

    # Preserve beginning space
    LBUFFER="${WHITESPACE}${LBUFFER}"
}

zle -N proxychains-command-line

# Defined shortcut keys: [Alt]+[C]
bindkey -M emacs '\ec'  proxychains-command-line
bindkey -M vicmd '\ec'  proxychains-command-line
bindkey -M viins '\ec'  proxychains-command-line
