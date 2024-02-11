#!/bin/bash

# This should fail with an inference fuse
eye --quiet data.trig rule1.trig rule2.trig query.trig | tee answer.trig
