# Complement

Test1 should fail with a fuse, because some property can't be its own complement.

Test2 should succeed because `:equal` is a defined a the complement of `:notEqual` .

Test3 should fail with a fuse, because `:equal` and `:notEqual` are also symmetric properties which leads to a contradiction given the data.

Test4 if the complement tricks would really do classical negation it should produce `:test :is true` but it won't. The complement makes use of Notation3 `{ premise } => false` tricks to create something that behaves a bit like a negation but a weaker form than classical negation: A & ~A will be a contradiction, but ~~A will not entail A.
  - Update 2024-02-17: with `HACKING` section the double negation can work for this example