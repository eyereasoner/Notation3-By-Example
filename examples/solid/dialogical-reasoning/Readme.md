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

The default test runs a data access on two resources using `context/default.n3` as request context.

```
bash test.sh
```

If you want to add your own request context to mess around, use the `-c` flag.
You can base yourself on the context files in the `context/` folder.

```
bash test -c path/to/context
```

### Ouput selection

The default ouptu is handled by the query surface at `query/default/queryPolicyResult.n3`. It only shows the access grants and denials.

If you want to see the data that is returned for these policies, use the following: (Note: only do this for `acl:Read` requests!)

```
bash test --data
```

If you want to see for each triple the metadata for its origin and why it has or has not been emitted, use the following: (Note: only do this for `acl:Read` requests!)

```
bash test --metadata
```

### Logging methods

use the `--log` flag to output all intermediate logging information.

```
bash test --log
```

use the `--test` flag to output ALL triples on the main surface.

```
bash test --all
```
