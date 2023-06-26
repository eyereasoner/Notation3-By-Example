# SHARCS ODRL Example - Experiment 2

This is a more elaborate experiment with a `data_consumer_policy.ttl` that contains more metadata about the assignee that needs to match the knowledge base `data.ttl`.

Based on Inès Akaichi's [ODRL policies](https://github.com/Ines-Akaichi/SHARCS-Use-Case/tree/2f4793e995e098b4241faa2f6af8d3541efab03b).

## Demo

Run the experiment:

```
$ ./run.sh
<urn:odrl-compiler:Result> odrl:action odrlp:grantAccess.
<urn:odrl-compiler:Result> <urn:odrl-compiler:policy> <http://example.org/policy/policy-authorization-organizationABC>.
<urn:odrl-compiler:Result> odrl:assignee ex:alice.
<urn:odrl-compiler:Result> odrl:target ex:Session2300.
```