# ODRL Policy Example

This is a proof of concept of a [ODRL](https://www.w3.org/TR/odrl-model/) policy checker for
logical constraints.

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
