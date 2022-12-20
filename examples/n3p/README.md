# N3P - Notation3 in Prolog

This directory contains examples how Notation3 can be extended
with Prolog in the EYE reasoner.

## Examples

- `demo.n3` - a simple N3 script
- `demo.n3p` - the N3P version of `demo.n3`
  - Created with `eye --nope --quiet --intermediate demo.n3p demo.n3

- `demo2.n3p` - an N3P example how to add extra data facts (adding Bob)
  - Run this script with `eye --nope --quiet --n3p demo2.n3p`

- `demo3.n3p` - an N3P example how to add backward rules, backward queries and forward queries in N3P
  - Run this script with `eye --nope --quiet --n3p demo3.n3p`