#!/bin/bash

DATA=$(find . -name "*.ttl")

# login
eye --nope --quiet --blogic ${DATA} check_login.n3s check_permissions.n3s query.n3s
