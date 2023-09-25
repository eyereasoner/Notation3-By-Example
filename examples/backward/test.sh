#!/bin/bash

for f in *.n3 ; do
    eye --nope --quiet $f > $f.output
done
