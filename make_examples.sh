#!/bin/bash

for n3 in crypto/*.n3 graph/*.n3 list/*.n3 log/*.n3 math/*.n3 string/*.n3 ; do
    eye --nope --quiet --pass-only-new --strings $n3 > $n3.out 2> /dev/null
done

for n3 in log/blogic/*.n3 ; do 
    eye --nope --quiet --pass-only-new --blogic $n3 > $n3.out 2> /dev/null
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