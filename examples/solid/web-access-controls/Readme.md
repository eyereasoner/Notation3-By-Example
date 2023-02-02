# Designing Rules using RDF Surfaces to emulate WAC on a Solid pod.

This is an example of how RDF Surfaces could be used to emulate WAC access policies over a Solid environment.

## Data preprocessing.

The data used can be found in the `data/` directory.
It emulated data from 4 pods (don't ask me why, it's too much effor to change this now), hosted by 2 different providers.

**The preprocessing is as follows:**

1. for every resource that is NOT a container:

- take the data graph, and put it on a neutral surface, so its triples are NOT ASSERTED
- add the resource type as known by the pod as ASSERTED triples
- add any connected ACL file using the `https://example.org/ns/acl` predicate. This is an ASSERTED triple, and represents the link header on the resource
- add any connected metadata file using the `https://example.org/ns/describedby` predicate. This is an ASSERTED triple, and represents the link header on the resource

Containers are exempt, because this is authoritative Solid pod data!
But are ACL files also not authoritative data I hear you ask? -> I don't know I guess probably but again it does not really matter that much.
The most important takeaway here is THAT WE NEVER ASSERT TRIPLES FROM A DOCUMENT!

2. for every container:

- assert all the triples (this is authoritative data)
- add any connected ACL file using the `https://example.org/ns/acl` predicate. This is an ASSERTED triple, and represents the link header on the resource

## Executing the test

Run the test using

```
bash test.sh
```

If you want to add your own request context to mess around, use the `-c` flag.
You can base yourself on the context that is given in the `context/` folder.

```
bash test -c path/to/context
```

If you want results for the resource indicated in your request, use the `--specific` flag

```
bash test --specific
```

(Don't use the -r flag atm. It's not yet implemented)
