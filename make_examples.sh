#!/bin/bash

RED="\033[31m"
PINK="\033[35m"
GREEN="\033[32m"
NORMAL="\033[0;39m"

OK=0
FAILED=0
SKIPPED=0

if [ "$1" == "clean" ]; then
    rm *.out 2> /dev/null
    for n3 in crypto graph list log math string ; do
        rm $n3/*.out 2> /dev/null
    done
    exit 0
fi 

for n3 in *.n3 crypto/*.n3 graph/*.n3 list/*.n3 log/*.n3 math/*.n3 string/*.n3 ; do
    if [[ "$n3" == "log/outputString.n3" ]] ; then
        echo "eye --nope --quiet --pass --strings $n3 > $n3.out 2> /dev/null"
        eye --nope --quiet --pass --strings $n3 > $n3.out 2> /dev/null
    elif [[ "$n3" =~ SKIP ]] ; then
        echo "(skipping $n3)" | tee $n3.out
    else
        echo "eye --nope --quiet --pass $n3 > $n3.out 2> /dev/null"
        eye --nope --quiet --pass $n3 > $n3.out 2> /dev/null
    fi
done

for n3s in blogic/*.n3s ; do 
    if [[ "$n3s" =~ SKIP ]] ; then
        echo "(skipping $n3s)" | tee $n3s.out
    else
        echo "eye --nope --quiet --blogic $n3s > $n3s.out 2> /dev/null"
        eye --nope --quiet --blogic $n3s > $n3s.out 2> /dev/null
    fi
done

for f in $(find . -name "*.out" | sort) ; do
    if [[ $f =~ examples ]]; then 
        continue
    fi

    echo -n "Testing $f ... "

    if [[ $f =~ FAIL ]] && [[ ! -s $f ]]; then
        echo -e "${GREEN}OK${NORMAL}"
        ((OK++))
    elif [[ $f =~ SKIP ]]; then
        echo -e "${PINK}SKIPPED${NORMAL}"
        ((SKIPPED++))
    elif [[ $(grep '<urn:example:test> <urn:example:is> true' $f) ]]; then
        echo -e "${GREEN}OK${NORMAL}"
        ((OK++))
    elif [[ $(grep '() log:onAnswerSurface true' $f) ]]; then
        echo "OK"
        ((OK++))
    else
        echo -e "${RED}FAILED${NORMAL}"
        ((FAILED++))
    fi
done

echo -e "Results: ${GREEN}${OK} OK${NORMAL}, ${RED}${FAILED} FAILED${NORMAL}, ${PINK}${SKIPPED} SKIPPED${NORMAL}"

if [[ ${FAILED} -eq 0 ]]; then 
    exit 0
else    
    exit 2
fi
