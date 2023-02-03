context="./context/default.n3"
quiet="--quiet"
querySet="default"
ruleset="surfaces-language"
specific="specific"

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
            echo "-r, --rules               use policy-language rules instead of plain RDF surfaces rules"
            echo "--computeAll              compute results for all available resources"
            echo "--test                    write out all triples"
            echo "--log                     write out everything on onLogSurface (overwrites test option)"
            echo "--data                    only write out data (overwrites test, log option)"
            echo "--metadata                writes out per-triple metadata (overwrites test, log,  data option)"
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
        -r|--ruleset)
            shift
            ruleset="policy-language"
            ;;
        --computeAll)
            shift
            specific="general"
            ;;
        --test)
            shift
            querySet="test"
            ;;
        --log)
            shift
            querySet="log"
            ;;
        --data)
            shift
            querySet="data"
            ;;
        --metadata)
            shift
            querySet="metadata"
            ;;
        *)
            echo "$1 is not a recognized flag!"
            exit 1
            ;;
    esac
done


echo "Command: find data/ -type f | xargs eye --nope $quiet --blogic ./core/* ./query/$querySet/*.n3 $context ./rules/$ruleset/$specific/*.n3"
echo ""
echo "Running test with context:"
echo "__________________________________________________________________"
cat $context
echo ""
echo "__________________________________________________________________"
echo ""
echo "Result:"
echo ""
find data/ -type f | xargs eye --nope $quiet --blogic ./core/* ./query/$querySet/*.n3 $context ./rules/$ruleset/$specific/*.n3