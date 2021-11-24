function _pure_prompt_k8s \
    --description 'Print kubectl context and namespace information'

    if set --query pure_enable_k8s; and test "$pure_enable_k8s" != true
        return
    end

    set --local k8s_prompt (__kube_prompt)
    set --local k8s_prompt_color (_pure_set_color $pure_color_info)
    echo -e "$k8s_prompt_color$k8s_prompt"
end
