run() {
    {
        echo
        echo "Выполнена команда:"
        printf '%s\n' "$*"
        echo
        echo "Результат:"
    } >&2
    "$@"
    echo >&2
}

to_punycode() {
    printf '%s' "$1" | python3 -c '
import sys
print(sys.stdin.buffer.read().decode("utf-8").encode("idna").decode())
' 2>/dev/null || printf '%s' "$1"
}
