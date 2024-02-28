#!/bin/bash

echo "test lists.trig"
eye --quiet --nope lists.trig | tee lists.trig.answer

echo "test lists.n3"
eye --quiet --nope lists.n3 --pass-only-new | tee lists.n3.answer

echo "test list_term.trig"
eye --quiet --nope list_term.trig | tee list_term.trig.answer

echo "test list_term.n3"
eye --quiet --nope list_term.n3 --pass-only-new | tee list_term.n3.answer