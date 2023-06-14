#!/bin/bash

DATA=$(find . -name "*.ttl")

# Run 1: reasoning part
eye --nope --quiet --blogic ${DATA} policies/check_*.n3s policies/query.n3s |\
    # Run 2: validation part (allows SNAF queries)
    eye --nope --quiet --blogic - \
        validation/valid_*.n3s \
        validation/policies/check_*.n3s \
        validation/query.n3s
