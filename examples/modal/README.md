# Modal logic in RDF Surfaces

First attempt to express modal logic in RDF Surfaces. We introduce a new surface 'onModalSurface' with properties:

- Nesting a modal surface in a negative surface creates a necessity
- Nesting a negative surface in a modal surfaces creates a probability


Usage:

```
eye --nope --quiet *.n3s
```

Examples:

```
# It is necessary that Alice likes cats 
() log:onNegativeSurface {
    () log:onModalSurface {
        :Alice :likes :Cats .
    }
}
```

```
# It is probable that Alice hates dogs 
() log:onModalSurface {
    () log:onNegativeSurface {
        :Alice :hates :Dogs .
    }
}
```

We introduce two rules as generalization:

- On an even surface (starting from the default surface as even), any negative surface may be converted into a modal surface 
- On an odd surface, any modal surface may be converted into a negative surface
