#!/bin/bash

for f in *.n3; do
    eye --nope --quiet --pass-only-new $f > $f.out
done