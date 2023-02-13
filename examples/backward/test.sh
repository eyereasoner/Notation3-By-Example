#!/bin/bash

for f in *.n3 ; do
    eye --blogic --quiet $f > $f.output
done
