# SHARCS ODRL Example

SHARCS example is a collection of data, rules and validation steps to simulate a data clearning house use-case.

This code is an expansion of the [sharcs example](https://github.com/eyereasoner/Notation3-By-Example/tree/main/examples/sharcs). Instead of writing the policy rules in [RDF Surfaces](https://w3c-cg.github.io/rdfsurfaces/) language we use the [ODRL2](https://www.w3.org/ns/odrl/2/) ontology examples provided by [Inès Akaichi](https://github.com/Ines-Akaichi/SHARCS-Use-Case).

## Data Content

- `data.ttl` : a sample instance of the data model
- `data_consumer_policy.ttl` : an ODRL policy for the data consumer
- `odrl_sharcs_profile.ttl` : an ODRL profile for the SHARCS project

## Compiler Content

- `compiler.n3` : an [Notation3](https://w3c.github.io/N3/spec/) ODRL to RDF Surfaces compiler
- `util.n3` : Notation3 utility user defined built-ins
- `constraint_checker.n3s` : a RDF Surfaces constraint checker
- `data_consumer_policy.q` : a query surface for the data consumer policy experiment
- `data_consumer_policy.n3s` : generated RDF Surfaces when running `run.sh`

## Scripts

- `run.sh` : compile `data_consumer_policy.ttl` into `data_consumer_policy.n3s` and run the reasoner on the `data.ttl`
- `test.sh` : testing the utility functions

## Demo

Run the experiment:

```
$ ./run.sh
<urn:odrl-compiler:Result> odrl:action odrlp:grantAccess.
<urn:odrl-compiler:Result> odrl:assignee ex:alice.
<urn:odrl-compiler:Result> odrl:target ex:Session2300.
<urn:odrl-compiler:Result> <urn:odrl-compiler:policy> <http://example.org/policy/policy-authorization>.
<urn:odrl-compiler:Result> <urn:odrl-compiler:constraint> _:sk_24.
<urn:odrl-compiler:Result> <urn:odrl-compiler:constraint> _:sk_26.
_:sk_24 a <urn:odrl-compiler:Constraint>.
_:sk_24 <urn:odrl-compiler:value> {
    _:sk_25 odrl:leftOperand odrl:dateTime.
    _:sk_25 odrl:operator odrl:lt.
    _:sk_25 odrl:rightOperand "2024-01-01"^^xsd:date.
}.
_:sk_26 a <urn:odrl-compiler:Constraint>.
_:sk_26 <urn:odrl-compiler:value> {
    _:sk_27 odrl:leftOperand odrl:dateTime.
    _:sk_27 odrl:operator odrl:gt.
    _:sk_27 odrl:rightOperand "2022-01-01"^^xsd:date.
}.
_:sk_24 <urn:odrl-compiler:is> <urn:odrl-compiler:Satisfied>.
_:sk_26 <urn:odrl-compiler:is> <urn:odrl-compiler:Satisfied>.
```

As experiment change some fields in the `data.ttl` (e.g. change  `ex:login` into `ex:bob`) and check the the access will not be granted.