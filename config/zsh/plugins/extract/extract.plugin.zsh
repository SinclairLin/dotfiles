alias x=extract

extract() {
    local remove_archive
    local success
    local extract_dir

    # if (( $# == 0 )); then
    #     cat <<-EOF >&2
    #         Usage: extract [-option] [file ...]

    #         Options:
    #             -r, --remove    Remove archive after unpacking.
    #     EOF
    # fi

    remove_archive=1
    if [[ "$1" == "-r" ]] || [[ "$1" == "--remove" ]]; then
        remove_archive=0
        shift
    fi

    while (( $# > 0 )); do
        if [[ ! -f "$1" ]]; then
            echo "extract: '$1' is not a valid file" >&2
            shift
            continue
        fi

        success=0
        extract_dir="${1:r}"

        case "${1:l}" in
            # ... （其他解压格式的处理，略）

            (*)
                mkdir -p "$extract_dir"
                cd "$extract_dir" || exit 1

                case "${1:l}" in
                    (*.gz) (( $+commands[pigz] )) && pigz -dk "../$1" || gunzip -k "../$1" ;;
                    (*.bz2) bunzip2 "../$1" ;;
                    (*.xz) unxz "../$1" ;;
                    # 添加其他格式的解压命令，如果需要的话
                    (*)
                        echo "extract: '$1' cannot be extracted" >&2
                        success=1
                    ;;
                esac

                cd ..

                (( success = $success > 0 ? $success : $? ))
                ;;
        esac

        (( $success == 0 )) && (( $remove_archive == 0 )) && rm "$1"
        shift
    done
}
