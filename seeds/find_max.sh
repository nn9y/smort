find . -type d -print0 | while read -d '' -r dir; do
    files=("$dir"/*)
    printf "%s:\t%s\n" "$dir" "${#files[@]}"
done

