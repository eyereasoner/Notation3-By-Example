#!/bin/bash

for n3 in list/*.n3 log/*.n3 math/*.n3 string/*.n3 ; do
    eye --nope --quiet --pass-only-new $n3 > $n3.out 2> /dev/null
done

for n2 in log/blogic/*.n3 ; do 
    eye --nope --blogic $n3 > $n3.out 2> /dev/null
done