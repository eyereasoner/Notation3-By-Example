#!/bin/bash

eye --nope --quiet --pass-only-new \
            compiler.n3 util.n3 data_consumer_policy.ttl > data_consumer_policy.n3s

eye --nope --quiet --blogic \
            data.ttl data_consumer_policy.ttl \
            data_consumer_policy.n3s data_consumer_policy.q
