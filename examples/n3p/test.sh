#!/bin/bash

eye --nope --quiet --pass --intermediate demo.n3p demo.n3 > /dev/null 2>&1

eye --nope --quiet --n3p demo.n3p 2> /dev/null

# Running own n3p code
eye --nope --quiet --n3p demo2.n3p > demo2.out.n3 2> /dev/null

eye --nope --quiet --n3p demo3.n3p > demo3.out.n3 2> /dev/null
