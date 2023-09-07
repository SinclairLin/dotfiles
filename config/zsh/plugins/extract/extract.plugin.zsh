
alias x=extract

extract() {
	local remove_archive
	local success
	local extract_dir

	if (( $# == 0 )); then
		cat <<-'EOF' >&2
			Usage: extract [-option] [file ...]

			Options:
			    -r, --remove    Remove archive after unpacking.
		EOF
	fi

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
		extract_dir="${1%.*}"  # Use the filename without extension as the extract directory
		mkdir -p "$extract_dir"  # Create the directory if it doesn't exist

		case "${1:l}" in
			(*.tar.gz|*.tgz) (( $+commands[pigz] )) && { pigz -dc "$1" | tar xv -C "$extract_dir" ; } || tar zxvf "$1" -C "$extract_dir" ;;
			(*.tar.bz2|*.tbz|*.tbz2) tar xvjf "$1" -C "$extract_dir" ;;
			(*.tar.xz|*.txz)
				tar --xz --help &> /dev/null \
				&& tar --xz -xvf "$1" -C "$extract_dir" \
				|| xzcat "$1" | tar xvf - -C "$extract_dir" ;;
			(*.tar.zma|*.tlz)
				tar --lzma --help &> /dev/null \
				&& tar --lzma -xvf "$1" -C "$extract_dir" \
				|| lzcat "$1" | tar xvf - -C "$extract_dir" ;;
			(*.tar.zst|*.tzst)
				tar --zstd --help &> /dev/null \
				&& tar --zstd -xvf "$1" -C "$extract_dir" \
				|| zstdcat "$1" | tar xvf - -C "$extract_dir" ;;
			(*.tar) tar xvf "$1" -C "$extract_dir" ;;
			(*.tar.lz) (( $+commands[lzip] )) && tar xvf "$1" -C "$extract_dir" ;;
			(*.gz) (( $+commands[pigz] )) && pigz -dk "$1" -c > "$extract_dir/$(basename "$1" .gz)" || gunzip -k "$1" -c > "$extract_dir/$(basename "$1" .gz)" ;;
			(*.bz2) bunzip2 -c "$1" > "$extract_dir/$(basename "$1" .bz2)" ;;
			(*.xz) unxz -c "$1" > "$extract_dir/$(basename "$1" .xz)" ;;
			(*.lzma) unlzma -c "$1" > "$extract_dir/$(basename "$1" .lzma)" ;;
			(*.z) uncompress -c "$1" > "$extract_dir/$(basename "$1" .z)" ;;
			(*.zip|*.war|*.jar|*.sublime-package|*.ipsw|*.xpi|*.apk|*.aar|*.whl) unzip "$1" -d "$extract_dir" ;;
			(*.rar) unrar x -ad "$1" "$extract_dir" ;;
			(*.rpm) mkdir -p "$extract_dir/control" && mkdir -p "$extract_dir/data" && cd "$extract_dir" && rpm2cpio "../$1" | cpio --quiet -id && cd .. ;;
			(*.7z) 7za x "$1" -o"$extract_dir" ;;
			(*.deb)
				mkdir -p "$extract_dir/control"
				mkdir -p "$extract_dir/data"
				cd "$extract_dir"; ar vx "../${1}" > /dev/null
				cd control; tar xzvf ../control.tar.gz
				cd ../data; extract ../data.tar.*
				cd ..; rm *.tar.* debian-binary
				cd ..
			;;
			(*.zst) unzstd -c "$1" > "$extract_dir/$(basename "$1" .zst)" ;;
			(*)
				echo "extract: '$1' cannot be extracted" >&2
				success=1
			;;
		esac

		(( success = $success > 0 ? $success : $? ))
		(( $success == 0 )) && (( $remove_archive == 0 )) && rm "$1"
		shift
	done
}

