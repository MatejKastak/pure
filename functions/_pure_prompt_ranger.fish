function _pure_prompt_ranger

    set --local ranger_prompt
    if test -n "$RANGER_LEVEL" 
        set ranger_prompt AAA
    end
    set --local ranger_prompt_color (_pure_set_color $pure_color_info)

    echo "$ranger_prompt_color$ranger_prompt"
end
