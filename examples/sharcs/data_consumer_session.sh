#!/bin/bash

DATA=data.ttl

# Run 1: reasoning part
eye --nope --quiet --blogic ${DATA} data_consumer_session.ttl \
    policies/data_consumer/check_*.n3s \
    policies/query.n3s \
    |\
    tee data_consumer_session.step1.ttl \
    |\
    # Run 2: validation part (allows SNAF queries)
    eye --nope --quiet --blogic - \
        validation/validator.n3s \
        validation/data_consumer/valid_*.n3s \
        validation/data_consumer/policies/check_*.n3s \
        validation/query.n3s \
        |\
        tee data_consumer_session.step2.ttl 
