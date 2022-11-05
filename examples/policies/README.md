# Mellon Policy Language Example

This is an [RDF Surfaces](https://josd.github.io/surface/) implementation of the [Mellon Rule language for decentralized business processes](https://mellonscholarlycommunication.github.io/spec-rulelanguage/).

A policy document described which actions a Mellon choreographer (orchestrator) process 
should take when receiving an incoming [Event Notification](https://www.eventnotifications.net)
message.

# Setup of the experiment

- `data.n3` - an example incoming Event Notification message
- `policy_1.n3` - a valid example policy document
- `policy_2_invalid.n3` - a invalid example policy document
- `compiler.n3` - a compiler of policies into RDF Surfaces
- `validation.n3` - a validator for policies that is used by the compiler
- `util.n3` - utility backward rulesused by the compiler
- `test.sh` - a test script to demo the execution of the policies for the data

# Rationale

The [EYE](https://github.com/josd/eyehttps://github.com/josd/eye) RDF Surfaces process will load all N3 data, and simultaneously validate and compile
the policy rules. The output will defined by the policies.

When running `test.sh` you should get as output:

```
@prefix : <http://example.org/ns#>.
@prefix pol: <https://github.com/phochste/policy#>.
@prefix log: <http://www.w3.org/2000/10/swap/log#>.
@prefix fno: <https://w3id.org/function/ontology#>.
@prefix util: <https://github.com/phochste/util#>.
@prefix list: <http://www.w3.org/2000/10/swap/list#>.
@prefix graph: <http://www.w3.org/2000/10/swap/graph#>.
@prefix math: <http://www.w3.org/2000/10/swap/math#>.

_:bn_1 pol:onAnswerSurface {:Record1 pol:policy _:bn_2. _:bn_2 a fno:Execution. _:bn_2 fno:executes :appendToLog}.
_:bn_1 pol:onAnswerSurface {:Record1 pol:policy _:bn_3. _:bn_3 a fno:Execution. _:bn_3 fno:executes :removeBlindCopies}.
_:bn_1 pol:onAnswerSurface {:Record1 pol:policy _:bn_4. _:bn_4 a fno:Execution. _:bn_4 fno:executes :sendMessage. _:bn_4 :to <https://github.com/josd/profile.ttl>. _:bn_4 :from <https://patrickhochstenbach.net/profile/card#me>. _:bn_4 :message <http://miel.data.pod/publications/mellon.pdf>}.
```