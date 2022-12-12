# ODRL Policy Example

This is a proof of concept of a [ODRL](https://www.w3.org/TR/odrl-model/) policy checker for constraints.

The contraint below expresses a policy valid until `2022-01-01`.

```
<http://example.com/policy:6163> a odrl:Offer ;
    odrl:profile <http://example.com/odrl:profile:10> ;
    odrl:permission [
         odrl:target <http://example.com/document:1234> ;
         odrl:assigner <http://example.com/org:616> ;
         odrl:action odrl:distribute ;   
         odrl:constraint [
            odrl:leftOperand odrl:dateTime ;
            odrl:operator odrl:lt ;
            odrl:rightOperand "2023-01-01"^^xsd:date
         ] 
    ] .
```

Inject a current date by editing `[ :currentDate "2022-12-11"^^xsd:date ] .` in the example.

# Examples

- example1.n3 - a policy that can be satisfied with the conditions stated
    - example1.txt - the output running the policychecker.n3 on this file
- example2.n3 - a policy that can not be satisfied with the conditions stated
    - example2.txt - the output running the policychecker.n3 on this file
- security.n3 - an extra security rule that states that we don't want not satisfied policies in the system
    - example2.withSecurity.txt - the output running the policycheck.n3 with security.n3 on example2.txt

# Requirements

EYE v22.1211.2244 or more recent
