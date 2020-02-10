while
    [ -n "$1" ]
do
    case "$1" in
    --branch)
        BRANCH="$2"
        OPT_BRANCH=true
        shift
        ;;
    --tag)
       TAG="$2"
       OPT_TAG=true
       shift
       ;;
    --include_all_modules)
        INCLUDE_ALL_MODULES="--include_all_modules"
        ;;
    *)
        echo "Option $1 not recognized"
        exit 1
        ;;
    esac
    shift
done