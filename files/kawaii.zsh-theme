if [[ $TERM == 'linux' || $TERM == 'xterm' ]]; then
    USER_COL=5
    DIR_COL=6
    UWU_COL=5
    OWO_COL=1
    TIME_COL=7
    BRACK_COL=2
    SEP_COL=3
    COL_COL=6

    username() {
        echo "%F{$USER_COL}%n%f"
    }
    directory() {
        echo "%F{$DIR_COL}%2~%f"
    }
    return_status() {
        echo "%(?.%F{$UWU_COL}UwU%f.%F{$OWO_COL}OwO%f)"
    }
    current_time() {
        echo "%F{$TIME_COL}%*%f"
    }
    open_brack() {
        echo "%F{$BRACK_COL}[%f"
    }
    close_brack() {
        echo "%F{$BRACK_COL}]%f"
    }
    colon() {
        echo "%F{$COL_COL}:%f"
    }
    separator() {
        echo "%F{$SEP_COL}|%f"
    }

    powercap() {
        echo "%B%F{$TIME_COL}$(cat /sys/class/power_supply/BAT1/capacity)%%%f%b"
    }

    # set the git_prompt_info text
    ZSH_THEME_GIT_PROMPT_PREFIX=""
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY="*"
    ZSH_THEME_GIT_PROMPT_CLEAN=" "

    # set the git_prompt_status text
    ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%}ADD%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}MDF%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}DLT%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}RNM%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}UMG%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%}UTK%{$reset_color%}"

    PROMPT='$(open_brack)$(username)$(separator)$(directory)$(close_brack)$(colon) '
    RPROMPT='$(git_prompt_status) $(return_status) $(current_time)'
    if [ -f /sys/class/power_supply/BAT1/capacity ]; then
        RPROMPT="$RPROMPT $(powercap)"
    fi

else
    # цвет текста на всех стрелках
    # если он будет разный, удали эту переменную
    TEXT_COL="#220a3e"

    # цвет первой стрелки (та, где имя юзера)
    # в случае если эта команда первая или предыдущая
    # команда выполнилась без ошибок
    USER_OK_ARR_COL="#ffc4e5"

    # цвет текста на первой стрелке в этих случаях
    USER_OK_TXT_COL=$TEXT_COL

    # цвет первой стрелки если предыдущая команда
    # выполнилась с ошибками
    USER_ERR_ARR_COL="#ff335c"

    # цвет текста на первой стрелке в этом случае
    USER_ERR_TXT_COL=$TEXT_COL

    # цвет второй стрелки (которая с путем)
    DIR_ARR_COL="183"

    # цвет текста на второй стрелке
    DIR_TXT_COL=$TEXT_COL

    # цвет стрелки гита
    GIT_ARR_COL="#ffa8af"

    # цвет текста на стрелке гита
    GIT_TXT_COL=$TEXT_COL

    # цвет UwU
    UWU_COL=220a3e

    # цвет OwO
    OWO_COL=ff335c

    # цвет времени
    TIME_COL=$TEXT_COL


    # echo OwO if there are errors, nothing otherwise
    return_status() {
        echo "%(?.%B%F{#$UWU_COL}UwU%f%b.%B%F{#$OWO_COL}OwO%f%b)"
    }

    right_triangle() {
        echo $'\ue0b0'
    }

    arrow_start() {
        echo "%F{$ARROW_FG}%K{$ARROW_BG}%B"
    }

    arrow_end() {
        echo "%b%f%k%F{$NEXT_ARROW_FG}%K{$NEXT_ARROW_BG}$(right_triangle)%k%f"
    }

    ok_username() {
        ARROW_FG=$USER_OK_TXT_COL
        ARROW_BG=$USER_OK_ARR_COL
        NEXT_ARROW_BG=$DIR_ARR_COL
        NEXT_ARROW_FG=$USER_OK_ARR_COL
        echo "$(arrow_start) %n $(arrow_end)"
    }

    err_username() {
        ARROW_FG=$USER_ERR_TXT_COL
        ARROW_BG=$USER_ERR_ARR_COL
        NEXT_ARROW_BG=$DIR_ARR_COL
        NEXT_ARROW_FG=$USER_ERR_ARR_COL
        echo "$(arrow_start) %n $(arrow_end)"
    }

    # return err_username if there are errors, ok_username otherwise
    username() {
        echo "%(?.$(ok_username).$(err_username))"
    }

    directory_and_git() {
        ARROW_FG=$DIR_TXT_COL
        ARROW_BG=$DIR_ARR_COL
        NEXT_ARROW_BG=default
        NEXT_ARROW_FG=$DIR_ARR_COL
        if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
            NEXT_ARROW_BG=$GIT_ARR_COL
            echo -n "$(arrow_start) %2~ $(arrow_end)"
            ARROW_FG=$GIT_TXT_COL
            ARROW_BG=$GIT_ARR_COL
            NEXT_ARROW_BG=default
            NEXT_ARROW_FG=$GIT_ARR_COL
            echo "$(arrow_start) $(_omz_git_prompt_info) $(arrow_end)"
        else
            echo -n "$(arrow_start) %2~ $(arrow_end)"
        fi

    }


    current_time() {
        echo "%B%F{$TIME_COL}%*%f%b"
    }

    powercap() {
        echo "%B%F{$TIME_COL}$(cat /sys/class/power_supply/BAT1/capacity)%%%f%b"
    }

    # set the git_prompt_info text
    ZSH_THEME_GIT_PROMPT_PREFIX=""
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY="*"
    ZSH_THEME_GIT_PROMPT_CLEAN=" "

    # set the git_prompt_status text
    ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%}A%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}M%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}D%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}R%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}G%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%}T%{$reset_color%}"

    PROMPT='$(username)$(directory_and_git) '
    RPROMPT='$(git_prompt_status) $(return_status) $(current_time)'

    if [ -f /sys/class/power_supply/BAT1/capacity ]; then
        RPROMPT="$RPROMPT $(powercap)"
    fi
fi
