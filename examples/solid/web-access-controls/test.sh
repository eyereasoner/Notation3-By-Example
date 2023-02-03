context="./context/default.n3"
quiet="--quiet"
querySet="default"
ruleset="surfaces-language"
specific="specific"
showtest=""
showlog=""

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
            echo "--log                     write out everything on onLogSurface"
            echo "--data                    write out the resource data to the main surface"
            echo "--metadata                writes out per-triple metadata (overwrites data option)"
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
            showtest="./query/test/*.n3"
            ;;
        --log)
            shift
            showlog="./query/log/*.n3"
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


echo "Running test with context:"
echo "__________________________________________________________________"
cat $context
echo ""
echo "__________________________________________________________________"
echo ""

if [ "$querySet" = "data" ] || [ "$querySet" = "metadata" ]
then 
    echo "Starting first run to calculate access grants and denials"
    echo ""
    find data/ -type f | xargs eye --nope $quiet --blogic ./core/* ./query/default/*.n3 $showlog $context ./rules/$ruleset/$specific/*.n3 > intermediate_results/output.n3
    # Note: we are asserting the results of the first run for the second run, because I am really not well-versed enough at this point to do it in a more appropriate way.
    # feel free to suggest how we could handle this better
    echo ""
    echo "Output of first run to: intermediate_results/output.n3"
    echo ""
    echo "Starting second run to resolve access-control collisions and calculate data access"
    echo ""
    echo "Result:"
    echo ""
    find data/ -type f | xargs eye --nope $quiet --blogic ./core/* ./query/$querySet/*.n3 $showtest $showlog $context ./meta-policies/*.n3 intermediate_results/output.n3
else 
    echo "Result:"
    echo ""
    find data/ -type f | xargs eye --nope $quiet --blogic ./core/* ./query/$querySet/*.n3 $showtest $showlog $context ./rules/$ruleset/$specific/*.n3
fi
