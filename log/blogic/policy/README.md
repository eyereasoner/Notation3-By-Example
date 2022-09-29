### The R-s are data resources

- `R1.n3` with information about Alice
- `R2.n3` with an address book of Alice
- `R3.n3` with information about her romantic partner Bob

### Policy are documents that describe who can access what data

- `Policy1.n3` states that a public context can only see the foaf:name and foaf:email
- `Policy2.n3` states that a friend can see all personal information

### Context provides the context of the user who wants to access the knowledge base

- `Context.n3` provides an example how to define a Public and Friend context
  
### Query are documents that filter out the fields to show from the results

- `Query.n3` is a query some user could have done

### Run example

```
eye --nope --quiet --blogic log/blogic/policy/*.n3
```

### Output public accesss

```
@prefix : <urn:example:>.
@prefix log: <http://www.w3.org/2000/10/swap/log#>.
@prefix foaf: <http://xmlns.com/foaf/0.1/>.

() log:onResultSurface {<urn:example:Person1> foaf:name "Alice". <<<urn:example:Person1> foaf:name "Alice">> log:ohyeah <urn:example:Policy_1>. <urn:example:Person1> foaf:email <mail:alice@somewhere.org>. <<<urn:example:Person1> foaf:email <mail:alice@somewhere.org>>> log:ohyeah <urn:example:Policy_1>}.
() log:onResultSurface {<urn:example:Person2> foaf:name "Bob". <<<urn:example:Person2> foaf:name "Bob">> log:ohyeah <urn:example:Policy_1>. <urn:example:Person2> foaf:email <mail:bob@somewhere.org>. <<<urn:example:Person2> foaf:email <mail:bob@somewhere.org>>> log:ohyeah <urn:example:Policy_1>}.
```

### Output friend access

```
@prefix : <urn:example:>.
@prefix log: <http://www.w3.org/2000/10/swap/log#>.
@prefix foaf: <http://xmlns.com/foaf/0.1/>.

() log:onResultSurface {<urn:example:Person1> a foaf:Person. <<<urn:example:Person1> a foaf:Person>> log:ohyeah <urn:example:Policy_2>}.
() log:onResultSurface {<urn:example:Person1> foaf:name "Alice". <<<urn:example:Person1> foaf:name "Alice">> log:ohyeah <urn:example:Policy_2>}.
() log:onResultSurface {<urn:example:Person1> foaf:telephone <urn:tel:0012-1219-212-121>. <<<urn:example:Person1> foaf:telephone <urn:tel:0012-1219-212-121>>> log:ohyeah <urn:example:Policy_2>}.
() log:onResultSurface {<urn:example:Person1> foaf:email <mail:alice@somewhere.org>. <<<urn:example:Person1> foaf:email <mail:alice@somewhere.org>>> log:ohyeah <urn:example:Policy_2>}.
() log:onResultSurface {<urn:example:Person1> foaf:address <urn:example:Address1>. <<<urn:example:Person1> foaf:address <urn:example:Address1>>> log:ohyeah <urn:example:Policy_2>}.
() log:onResultSurface {<urn:example:Person1> <urn:example:inLoveWith> <urn:example:Person2>. <<<urn:example:Person1> <urn:example:inLoveWith> <urn:example:Person2>>> log:ohyeah <urn:example:Policy_2>}.
() log:onResultSurface {<urn:example:Person2> a foaf:Person. <<<urn:example:Person2> a foaf:Person>> log:ohyeah <urn:example:Policy_2>}.
() log:onResultSurface {<urn:example:Person2> foaf:name "Bob". <<<urn:example:Person2> foaf:name "Bob">> log:ohyeah <urn:example:Policy_2>}.
() log:onResultSurface {<urn:example:Person2> foaf:telephone <urn:tel:0213-3123-1231>. <<<urn:example:Person2> foaf:telephone <urn:tel:0213-3123-1231>>> log:ohyeah <urn:example:Policy_2>}.
() log:onResultSurface {<urn:example:Person2> foaf:email <mail:bob@somewhere.org>. <<<urn:example:Person2> foaf:email <mail:bob@somewhere.org>>> log:ohyeah <urn:example:Policy_2>}.
```
