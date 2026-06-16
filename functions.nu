# path parser
def p [...parts: string] {
    $parts | each {|it|
        if ($it == "~") { $env.HOME } else if ($it in ($env | columns)) { $env | get $it } else { $it }
    } | path join
}

def celebrate-100 [] { 
    print "🎉 100 Commits Reached! 🎉"; 
    git log -1 --pretty=format:'%h - %an, %ar : %s' 
}

# eza wrapper
def el [
    target: any = "."
    --long (-l)
    --all (-a)
    --git-ignore (-g)
    --depth (-d): int = 1
] {
    mut args = ["--header", "--group-directories-first", "--octal-permissions", "--icons=always"]
    mut final_path = "."
    mut final_depth = $depth

    let is_number = (try { ($target | into int); true } catch { false })

    if $is_number {
        $final_depth = ($target | into int)
        $final_path = "."
    } else {
        $final_path = ($target | into string)
    }

    if $long {
        $args = ($args | append ["--long", "--extended"])
    } else {
        $args = ($args | append ["--tree", "--level", ($final_depth | into string)])
    }

    if $all { $args = ($args | append "--all") }
    if $git_ignore { $args = ($args | append "--git-ignore") }

    ^eza ...$args $final_path
}

# pyenv loader
def --env load-pyenv [path: string = ".venv"] {
    let venv_dir = ($path | path expand)
    let bin_dir = ($venv_dir | path join "bin")

    if ($bin_dir | path exists) {
        $env.VIRTUAL_ENV = $venv_dir
        $env.PATH = ($env.PATH | prepend [$bin_dir])
        print $"[ * ] Success loading: ($venv_dir)"
    } else {
        error make {msg: $"[ - ] Failed loading: There is no found bin/: ($bin_dir)"}
    }
}

def pull-photos [] {
    let local_dest = ("~/pictures/iphone/" | path expand)
    
    if not ($local_dest | path exists) { 
        mkdir $local_dest 
        print $"Created directory: ($local_dest)"
    }

    print "Connecting to iPhone hub (172.20.10.1)..."

    ^rsync -avz --ignore-existing -e "ssh -p 2222" root@172.20.10.1:/mnt/ $local_dest

    let count = (ls $local_dest | length)
    print $"Sync complete. Your Zen archive now has ($count) items."
}
