# Lingua versus Notation3 

## Experiment 1

These examples show a difference between Lingua and Notation3 handling of blank nodes.

The use-case tries to match a triple pattern `_:x0 rdf:rest ?What` in a premise for Lingua and Notation3.

In Lingua blank nodes are global and the `_:x0` should bind to the global `_:x0` in the data.

In Notation3 blank nodes are scoped to the premise `_:x0` becomes a universally quantified variable binding to all subjects with a `rdf:rest` predicate.

The Lingua result is:

```
:result :is (2 3).
```

The Notation3 result is:

```
:result :is (2 3).
:result :is (3).
:result :is ().
```

## Experiment 2

In Lingua no list terms should exist. All lists are internally rdf:first/rdf:rest graphs.

The `list_term.trig` experiment should not provide an answer if lists are rdf:first/rdf:rest pairs.

The `list_term.n3` should only provide an example if rdf:rest is a built-in (which is debatable).
