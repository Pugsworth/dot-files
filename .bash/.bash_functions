quick_name() {

    if [[ $1 == "--help" ]]; then
        echo "Generate a random name of variable length from upper and lowercase letters"
        echo "Usage: quick_name [N]"
        echo "   N=5     Length of name in characters"
        return -1
    fi

    T=({a..z} {A..Z})
    L=${#T[@]}

    for i in $( seq 0 $(( ${1:-6} - 1 )) )
    do
        P=$(( RANDOM % L ))
        echo -ne ${T[$P]}
    done

    echo ""

}

let_it_snow() {
    perl -e'select((),(),(),.1),print"H*\x1b[1T\x1b[;",rand`tput cols`|0while 1'
}

processes_from_this_terminal() {
     pty=$(tty | awk '{print $NF}' FS=/)
     ps | grep $pty
}


showimage() {
    path=$1;
    name=$(mktemp);
    wget -q --show-progress "$path" -O $name \
    && convert "$name" -resize "$(( `tput cols` * 8 ))x" "$name" \
    && img2sixel "$name" ${@:2} \
    && rm "$name"; \
}



Bookmark() {
    if [ -z $1 ]; then
        path=$(pwd)
    else
        path=$1
    fi

    if [ -f path ]; then
        path=$(dirname $path)
    fi

    if [ ! -d path ]; then
        echo "Directory doesn't exist!"
        return 1;
    fi

    if [[ $OSTYPE =~ cygwin.* ]]; then
        path=$(cygpath $path)
    fi

}

fixext() {
    ext=$(grep $(file -b --mime-type "$1") /etc/mime.types | awk '{print $2}');

    if [ "${ext:0:1}" = "#" ]; then
        echo "mime has no known extension.";
    else
        echo "Extension is: $ext";
    fi

    if [ -z "$ext" ]; then
        echo "Unknown file!";
        return -1;
    fi

    newname="$(echo -n "${1%%.*}.")${ext}";

    if [ -f "$newname" ]; then
        echo "File exists";
        return -1;
    fi

    cp $1 $newname;
    echo "copied to $(basename $newname)";
}
