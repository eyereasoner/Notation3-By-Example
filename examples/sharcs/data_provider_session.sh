#!/bin/bash

DATA=$(find . -name "*.ttl")

# Run 1: reasoning part
eye --nope --quiet --blogic ${DATA} \
    policies/data_provider/check_*.n3s \
    policies/data_provider/query.n3s 