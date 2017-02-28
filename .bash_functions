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
	 test=$(tty | awk '{print $NF}' FS=/)
	 ps | grep $test
}
