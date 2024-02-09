#!/bin/bash

# This should fail with an inference fuse
eye --quiet data.trig owl-differentFrom.trig owl-disjointWith.trig --output answer.trig
