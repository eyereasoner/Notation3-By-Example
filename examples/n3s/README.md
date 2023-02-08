# N3S - Notation3 in RDF Surfaces

N3S is an experimental implementation of Notation3 in RDF Surfaces introducing:

- n3s:implies - a RDF Surfaces implementation of log:implies
- q:A , q:B , q:.. - a RDF Surfaces definition of Notation3 quickvars (?A ?B ...)

N3S scripts can be executed by providing `n3s:implies` rules. E.g.

```
{ Antecedent-Triples } n3s:implies { Consequent-Triples }
```

The Socrates example can be written like:

```
@prefix : <urn:example.org:> .
@prefix q: <https://github.com/eyereasoner/Notation3-By-Example/example/n3q#> .
@prefix n3s: <https://github.com/eyereasoner/Notation3-By-Example/example/n3s#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>.

:Socrates a :Human .
:Human rdfs:subClassOf :Mortal .

{
    q:A rdfs:subClassOf q:B .
    q:S a q:A .
} 
n3s:implies
{
    q:S a q:B .
} .
```

This results in :

```
<urn:example.org:Socrates> a <urn:example.org:Human>.
<urn:example.org:Socrates> a <urn:example.org:Mortal>.
```

## Requires

EYE v2.3.7 or more recent

## Limitations

- Limited support for nested graphs in the antecedent of a rule
    - Scoping of nested graphs in antecedent of a rule in not working. (See `nestes2.n3s`)

## Implemented with

- graph:union
- graph:list
- list:append
- list:firstRest
- list:length
- list:unique
- log:equalTo
- log:includes
- log:onNegativeSurface
- log:onQuerySurface
- log:rawType
- log:skolem
- math:greaterThan