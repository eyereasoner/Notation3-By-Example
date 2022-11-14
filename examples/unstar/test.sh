#!/bin/bash

OK=0
FAILED=0
SKIPPED=0

for f in test*.n3 ; do
    echo "${f}..."
    eye --nope --quiet --pass unstar.n3 ${f} > ${f}.out 2> /dev/null
done

for f in *.out ; do
    echo -n "Testing $f ... "

    if [[ $(grep '<urn:example:test> <urn:example:is> true' $f) ]]; then
        echo "OK"
        ((OK++))
    else
        echo "FAILED"
        ((FAILED++))
    fi
done

echo "Results: ${OK} OK , ${FAILED} FAILED"

if [[ ${FAILED} -eq 0 ]]; then 
    exit 0
else    
    exit 2
fi
