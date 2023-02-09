## Data pre-processing

The first step, is to match data based on an available set of properties that can serve as an identifier.
In this case, we a `https://example.org/ns/universalIdentifier` predicate was added to serve as this identifier.
Through this mapping, we can find a mapping between the identifiers of shared objects between the two institutions.

```
<A> :universalIdentifier <X>
<B> :universalIdentifier <X>
=>
<A> :equalTo <B>
```
