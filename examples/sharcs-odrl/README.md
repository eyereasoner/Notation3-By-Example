# SHARCS ODRL Example

SHARCS example is a collection of data, rules and validation steps to simulate a data clearning house use-case.

This code is an expansion of the [sharcs example](https://github.com/eyereasoner/Notation3-By-Example/tree/main/examples/sharcs). Instead of writing the policy rules in [RDF Surfaces](https://w3c-cg.github.io/rdfsurfaces/) language we use the [ODRL2](https://www.w3.org/ns/odrl/2/) ontology examples provided by [Inès Akaichi](https://github.com/Ines-Akaichi/SHARCS-Use-Case).

## Architecture

This experiment contains the core knowledge base `data.ttl` which can be accessed using RDF Surfaces policies (the `.n3s` files). These policies are compiled from their Turtle source files:

- `data_consumer_policy.n3s` is compiled version of the Turtle source `data_consumer_policy.ttl`
  
ODRL policies can contain zero or more constraints that are checked using a Notation3 constraint checker `constraint_checker.n3`.

```
[KnowledgeBase] --> 
  {Compile .ttl policies into .n3s (surfaces)} -->
  {Surface Reasoning with [KnowledgeBase] + [.n3s Policies] + [.q Query]} --> 
  {Notation3 Reasoning with [.n3 Constraints]} -->
  [Output]
```

In this setup, the RDF Surfaces policies contain only existential rules, executing basic graph pattern queries over the data.

### Execution steps

1. Compile `data_consumer_policy.ttl` into `data_consumer_policy.n3s` .
2. Reason over `data.ttl` using `data_consumer_policy.n3s`.
  - Results in a `<urn:odrl-compiler:Result>` output with zero or more constraints when all policy conditions are met.
3. Check if the reasoning ouput `<urn:odrl-compiler:Result>`  satisfies all constraints.

## Data Content

- `data.ttl` : a sample instance of the data model
- `data_consumer_policy.ttl` : an ODRL policy for the data consumer
- `odrl_sharcs_profile.ttl` : an ODRL profile for the SHARCS project

## Compiler Content

- `compiler.n3` : an [Notation3](https://w3c.github.io/N3/spec/) ODRL Turtle to RDF Surfaces compiler
- `util.n3` : a set of Notation3 utility built-ins 
- `constraint_checker.n3` : a Notation3 constraint checker
- `date.ttl` : a data file containing the current date
- `data_consumer_policy.q` : a query surface that defines which result data to expose to the world
- `data_consumer_policy.n3s` : compiled RDF Surfaces  of `data_consumer_policy.ttl`

## Scripts

- `run.sh` : run all the execution steps as explained above
- `test.sh` : testing script for the utility functions

## Demo

Run the experiment:

```
$ ./run.sh
<urn:odrl-compiler:Result> odrl:action odrlp:grantAccess.
<urn:odrl-compiler:Result> <urn:odrl-compiler:policy> <http://example.org/policy/policy-authorization>.
<urn:odrl-compiler:Result> odrl:assignee ex:alice.
<urn:odrl-compiler:Result> odrl:target ex:Session2300.
<urn:odrl-compiler:Result> <urn:odrl-compiler:constraint> _:e_sk_12_1.
<urn:odrl-compiler:Result> <urn:odrl-compiler:constraint> _:e_sk_13_1.
_:e_sk_12_1 a <urn:odrl-compiler:Constraint>.
_:e_sk_13_1 a <urn:odrl-compiler:Constraint>.
_:e_sk_12_1 odrl:leftOperand odrl:dateTime.
_:e_sk_13_1 odrl:leftOperand odrl:dateTime.
_:e_sk_12_1 odrl:operator odrl:lt.
_:e_sk_13_1 odrl:operator odrl:gt.
_:e_sk_12_1 odrl:rightOperand "2024-01-01"^^xsd:date.
_:e_sk_13_1 odrl:rightOperand "2022-01-01"^^xsd:date.
_:bn_1 <urn:odrl-compiler:currentDate> "2022-12-11"^^xsd:date.
_:e_sk_12_1 <urn:odrl-compiler:is> <urn:odrl-compiler:Satisfied>.
_:e_sk_13_1 <urn:odrl-compiler:is> <urn:odrl-compiler:Satisfied>.
```

As experiment, change some fields in the `data.ttl` (e.g. change  `ex:login` into `ex:bob`) and check that the access will not be granted. Or, change the date in `date.ttl` into the past to see the constraints fail.