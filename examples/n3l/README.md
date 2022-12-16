# N3L - RDF Surfaces in Lists

N3L is a serialization of [RDF Surfaces](https://w3c-cg.github.io/rdfsurfaces/) in pure RDF (without
N3 subgraphs or notation). The N3L is a lisp like implementation of RDF Surfaces introducing:

- `log:neg` as a negative surface function
- `log:pos` as a positive surface function
- `log:query` as a query surface function
- `log:construct` as a construct surface function

N3L programs can be executed by providing at least a (possible empty) list of parameters and
a zero or groups of 3 arguments that constitute the triples:

```
( N3L-Fuction (Params) 
    S1 P1 O1
    S2 P2 O2
    .... ) log:evalAs log:RDFSurface .
```

The Socrated example can be programmed like:

```
@prefix : <urn:example.org:> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>.
@prefix log: <http://www.w3.org/2000/10/swap/log#> .

:Socrates a :Human .
:Human rdfs:subClassOf :Mortal .

( log:neg (_:A _:B _:S)
    _:A rdfs:subClassOf _:B
    _:S rdf:type _:A
    ( log:neg () 
        _:S rdf:type _:B
    )
) log:evalAs log:RDFSurface .

( log:query (_:S _:O)
    _:S rdf:type _:O
) log:evalAs log:RDFSurface .
```

This results in :

```
<urn:example.org:Socrates> a <urn:example.org:Human>.
<urn:example.org:Socrates> a <urn:example.org:Mortal>.
```

Note that `rdf:type`-s should be written explicitly in the list and not as `a`.