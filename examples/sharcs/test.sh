#!/bin/bash

DATA=$(find . -name "*.ttl")

# login
eye --nope --quiet --blogic ${DATA} check_*.n3s query.n3s
