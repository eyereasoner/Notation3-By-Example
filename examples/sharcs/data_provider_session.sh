#!/bin/bash

DATA=$(find grant organizations pmp policies validation -name "*.ttl")

# Run 1: reasoning part
eye --nope --quiet --blogic ${DATA} data_provider_session.ttl \
    policies/data_provider/check_*.n3s \
    policies/data_provider/query.n3s \
    |\
    # Run 2: validation part (allows SNAF queries)
    eye --nope --quiet --blogic - \
        validation/data_provider/valid_*.n3s \
        validation/data_provider/policies/check_*.n3s \
        validation/data_provider/query.n3s 