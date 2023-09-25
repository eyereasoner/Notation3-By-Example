#!/bin/bash

GENID=3917894951695475063 # Only for testing to keep github diffs small
eye --nope --quiet --skolem-genid ${GENID} compiler.n3 socrates.n3s > socrates.txt
eye --nope --quiet --skolem-genid ${GENID} compiler.n3 blanknode.n3s > blanknode.txt
eye --nope --quiet --skolem-genid ${GENID} compiler.n3 nested.n3s > nested.txt
eye --nope --quiet --skolem-genid ${GENID} compiler.n3 nested2.n3s > nested2.txt
eye --nope --quiet --skolem-genid ${GENID} compiler.n3 witness.n3s > witness.txt
