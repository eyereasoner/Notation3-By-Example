#  Global

_1_

```
# There is somebody who is the mother of every person
\exist x , \forall y : (y a :Person) => (x :motherOf y)
```

Not equal to

_2_

```
# Every person has a mother
\forall y , \exists x (y a :Person) => (x :motherOf y)
```

Lingua seems to use form _1_ .

Option _2_ can be simulated by generating a blank node using a `log:skolem` in rule1:

```
_:premise1 {
    var:X a :Person .
    var:X log:skolem var:M .
}

_:conclusion1 {
    var:M :motherOf var:X .
}
```