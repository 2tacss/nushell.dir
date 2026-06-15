source ~/.cache/oh-my-posh.nu
source ~/.config/nushell/functions.nu

let posh_prompt = $env.PROMPT_COMMAND

$env.PROMPT_COMMAND = { ||
    let base = (do $posh_prompt)
    $"($base)\e[?25l"
}

$env.EDITOR = "hx"

$env.config = {
    show_banner: false
    edit_mode: emacs
    cursor_shape: { emacs: block, vi_insert: block, vi_normal: block }
    
    color_config: {
        shape_garbage: { fg: "#ff9600" bg: "default"} 
        shape_variable: { fg: "#ff87d7" bg: "default" }
        shape_external_resolved: { fg: "#ff87d7" bg: "default" }
        hint: { fg: "#666666" bg: "default" }
        completions: { selected_text: { fg: "#1e1e2e" bg: "#ff87d7" } } 
    }

    hooks: {
        pre_prompt: [{ || print -n "\e[?25l" }]
        pre_execution: [{ || print -n "\e[?25l" }]
        env_change: {
            PWD: [{ |before, after|
                # if ($env.PYENV_ROOT | path exists) {
                #     pyenv init - nushell | save -f ~/.cache/pyenv.nu
                # }
            }]
        }
    }
    history: {
        max_size: 10000
        sync_on_enter: true
        file_format: "plaintext"
        #isolation: true
    }
}

alias check = batcat
alias clear = ^paclear

def newsboat [] {
    ^newsboat -C ($env.XDG_CONFIG_HOME | path join "newsboat/config") -u ($env.XDG_CONFIG_HOME | path join "newsboat/urls") -c ($env.XDG_CONFIG_HOME | path join "newsboat/cache.db")
}

fastfetch --config ~/.config/themes/current-theme/fastfetch.jsonc
print -n "\e[?25l"

alias wgcc = x86_64-w64-mingw32-gcc
