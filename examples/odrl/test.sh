#!/bin/bash

eye --nope --quiet --blogic example1.n3 policychecker.n3 > example1.txt 
eye --nope --quiet --blogic example2.n3 policychecker.n3 > example2.txt 
eye --nope --quiet --blogic example2.n3 policychecker.n3 security.n3 > example2.withSecurity.txt 2>&1