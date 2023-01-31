while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "Test the different serializations for Solid pod resources for data access and retrieval"
            echo " "
            echo "options:"
            echo "-h, --help                        show brief help"
            echo "-i, --input <input file>          input resource"
            echo "-o, --output <output file>        output resource"
            echo "-s, --surface <surface name>      name of the surface to put the data on"
            exit 0
            ;;
        -i|--input)
            shift
            input=$1
            shift
            ;;
        -o|--output)
            shift
            output=$1
            shift
            ;;
        -s|--surface)
            shift
            surface=$1
            shift
            ;;
        *)
            echo "$1 is not a recognized flag!"
            exit 1
            ;;
    esac
done

echo "Movind data at file $input to surface $surface and storing output in $output."
echo ""

echo "
@prefix : <https://example.org/ns/>.
@prefix log: <http://www.w3.org/2000/10/swap/log#>. 
@prefix string: <http://www.w3.org/2000/10/swap/string#> .


(_:S _:P _:O _:string) log:onQuerySurface {
    _:S _:P _:O .
    _:P log:uri _:string .
    _:string string:notMatches "http://www.w3.org/2000/10/swap/log#.*" .

    () log:onConstructSurface {
        ()log:onDataSurface {
            _:S _:P _:O .
        }
    } 
} .
"


#eye --nope $quiet --blogic ./${core}/* $context ./rules/$format/wac-$access.n3 ./data/$format/*