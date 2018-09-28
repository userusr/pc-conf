alias tmux='TERM=screen-256color tmux'

alias osupg='apt update && apt dist-upgrade -y && apt autoremove -y'

ax_backup() {
    if [ "$#" -ne 1 ]; then
        echo "Illegal number of parameters"
        return
    fi

    if [ ! -d "$1" ]; then
        echo "Parameter mast be a directory"
        return
    fi

    local name=$(basename "$1")
    local arc_name="$(pwd)/${name}_$(date +%Y%m%d%H%M%S).backup.tar.xz"

    cd "$(dirname "$1")"
    tar -Jcvf "${arc_name}" "${name}"/
}
