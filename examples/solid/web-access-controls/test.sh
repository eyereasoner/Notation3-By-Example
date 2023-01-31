context="./context/default.n3"
quiet="--quiet"
core="core"
ruleset="surfaces-language"

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "Test the different serializations for Solid pod resources for data access and retrieval"
            echo " "
            echo "options:"
            echo "-h, --help                show brief help"
            echo "-c, --context=context     context file. defaults to  ./context/context_valid.n3"
            echo "-v, --verbose             print engine logs"
            echo "-t, --test                print whole internal state"
            echo "-r, --ruleset             use policy-language rules instead of plain RDF surfaces rules"
            exit 0
            ;;
        -c|--context)
            shift
            context=$1
            shift
            ;;
        -v|--verbose)
            shift
            quiet=""
            ;;
        -t|--test)
            shift
            core="test"
            ;;
        -r|--ruleset)
            shift
            ruleset="policy-language"
            ;;
        *)
            echo "$1 is not a recognized flag!"
            exit 1
            ;;
    esac
done


echo "Command: find data/ -type f | xargs eye --nope $quiet --blogic ./${core}/* $context ./rules/$ruleset/*.n3"
echo ""
find data/ -type f | xargs eye --nope $quiet --blogic ./${core}/* $context ./rules/$ruleset/*.n3