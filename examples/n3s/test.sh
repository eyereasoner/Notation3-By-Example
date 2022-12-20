#!/bin/bash

GENID=3917894951695475063 # Only for testing to keep github diffs small
eye --blogic --quiet --skolem-genid ${GENID} compiler.n3 socrates.n3s > socrates.txt
eye --blogic --quiet --skolem-genid ${GENID} compiler.n3 blanknode.n3s > blanknode.txt
