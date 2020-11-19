source $current_dirname/../functions/_pure_check_for_new_release.fish
source $current_dirname/../functions/_pure_prompt_ending.fish

set --local succeed 0
set --local empty ''
function _pure_set_color; echo $empty; end # drop coloring during test

@test "_pure_check_for_new_release: is disabled" (
    set --global pure_check_for_new_release false

    _pure_check_for_new_release
) $status -eq $succeed


@test "_pure_check_for_new_release: nothing when same as latest" (
    set --global pure_check_for_new_release true
    set --global pure_version 0.0.1
    function curl; echo '"tag_name": "v0.0.1",'; end # mock

    _pure_check_for_new_release
) = '🛈 Checking for new release…'

@test "_pure_check_for_new_release: show fisher command to install when enable" (
    set --global pure_check_for_new_release true
    set --global pure_version 0.0.1
    function curl; echo '"tag_name": "v9.9.9",'; end # mock

    set output (_pure_check_for_new_release 2>&1)
    echo $output[2] $output[4]
) = '🔔 New version available! fisher install rafaelrinaldi/pure@9.9.9'
