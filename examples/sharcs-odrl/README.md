# SHARCS ODRL Example

SHARCS example is a collection of data, rules and validation steps to simulate a data clearning house use-case.

This code is an expansion of the [sharcs example](https://github.com/eyereasoner/Notation3-By-Example/tree/main/examples/sharcs). Instead of writing the policy rules in [RDF Surfaces](https://w3c-cg.github.io/rdfsurfaces/) language we use the [ODRL2](https://www.w3.org/ns/odrl/2/) ontology exampes provided by [Inès Akaichi](https://github.com/Ines-Akaichi/SHARCS-Use-Case).

## Data Content

- `data.ttl` : a sample instance of the data model
- `data_consumer_policy.ttl` : an ODRL policy for the data consumer
- `odrl_sharcs_profile.ttl` : an ODRL profile for the SHARCS project

## Compiler Content

- `compiler.n3` : an [Notation3](https://w3c.github.io/N3/spec/) ODRL to RDF Surfaces compiler
- `util.n3` : Notation3 utility user defined built-ins
- `data_consumer_policy.q` : a query surface for the data consumer policy experiment
- `data_consumer_policy.n3s` : generated RDF Surfaces when running `run.sh`

## Scripts

- `run.sh` : compile `data_consumer_policy.ttl` into `data_consumer_policy.n3s` and run the reasoner on the `data.ttl`
- `test.sh` : testing the utility functions

## Demo

Run the experiment:

```
$ ./run.sh
<urn:odrl-compiler:MyResult> <urn:odrl-compiler:is> odrlp:grantAccess.
```

As experiment change some fields in the `data_consumer_policy.ttl` (e.g. change  `foaf:Organization` into `foaf:Organization123`) and check the the access will not be granted.