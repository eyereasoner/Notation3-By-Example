#!/bin/bash

# Compile the Turtle policy into RDF Surfaces
eye --nope --quiet --pass-only-new \
            compiler.n3 util.n3 data_consumer_policy.ttl > data_consumer_policy.n3s

# Run the RDF Surfaces policy on the data
eye --nope --quiet --blogic \
            data.ttl \
            data_consumer_policy.n3s \
            data_consumer_policy.q |\
    # Execute the constaint checks
    eye --nope --quiet --pass - date.ttl constraint_checker.n3