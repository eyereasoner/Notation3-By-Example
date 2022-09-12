#!/bin/bash

if [ "$1" == "clean" ]; then
    rm *.out 2> /dev/null
    for n3 in crypto graph list log math string time ; do
        rm $n3/*.out 2> /dev/null
    done
    exit 0
fi 

for n3 in *.n3 crypto/*.n3 graph/*.n3 list/*.n3 log/*.n3 math/*.n3 string/*.n3 time/*.n3 ; do
    if [[ "$n3" == "log/outputString.n3" ]] ; then
        eye --nope --quiet --pass --strings $n3 > $n3.out 2> /dev/null
    else
        eye --nope --quiet --pass $n3 > $n3.out 2> /dev/null
    fi
done

for n3 in log/blogic/*.n3 ; do 
    eye --nope --quiet --blogic $n3 > $n3.out 2> /dev/null
done

for f in $(find . -name "*.out") ; do
    echo -n "Testing $f ... "

    if [[ $f =~ blogic ]]; then 
        echo "SKIPPED"
    elif [[ $(grep '<urn:example:is> true' $f) ]]; then
        echo "OK"
    else
        echo "FAILED"
    fi
done