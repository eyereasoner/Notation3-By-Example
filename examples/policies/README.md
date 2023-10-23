# Mellon Policy Language Example

This is an [RDF Surfaces](https://josd.github.io/surface/) implementation of the [Mellon Rule language for decentralized business processes](https://mellonscholarlycommunication.github.io/spec-rulelanguage/).

A policy document describes which actions a Mellon choreographer (orchestrator) process 
should take when receiving an incoming [Event Notification](https://www.eventnotifications.net)
message.

# Setup of the experiment

- `data.n3` - an example incoming Event Notification message
- `policy_1.n3` - a valid example policy document
- `policy_2_invalid.n3` - a invalid example policy document
- `policy_3_neg.n3` - a policy that contradicts `policy_1.n3` with sample data
- `compiler.n3` - a compiler of policies into RDF Surfaces
- `validation.n3` - a validator for policies that is used by the compiler
- `util.n3` - utility backward rulesused by the compiler
- `test.sh` - a test script to demo the execution of the policies for the data

# Rationale

The [EYE](https://github.com/josd/eyehttps://github.com/josd/eye) RDF Surfaces process will load all N3 data, and simultaneously validate and compile
the policy rules. The output will defined by the policies.

When running `test_valid.sh` you should get as output:

```
@prefix : <http://example.org/ns#>.
@prefix pol: <https://github.com/phochste/policy#>.
@prefix log: <http://www.w3.org/2000/10/swap/log#>.
@prefix fno: <https://w3id.org/function/ontology#>.
@prefix util: <https://github.com/phochste/util#>.
@prefix list: <http://www.w3.org/2000/10/swap/list#>.
@prefix graph: <http://www.w3.org/2000/10/swap/graph#>.
@prefix math: <http://www.w3.org/2000/10/swap/math#>.

:Record1 pol:policy _bn_1.
_bn_1 a fno:Execution.
_bn_1 fno:executes :appendToLog.
:Record1 pol:policy _bn_2.
_bn_2 a fno:Execution.
_bn_2 fno:executes :removeBlindCopies.
:Record1 pol:policy _bn_3.
_bn_3 a fno:Execution.
_bn_3 fno:executes :sendMessage.
_bn_3 :to <https://somebody.net/profile/card#me>.
_bn_3 :from <https://alice.net/card#me>.
_bn_3 :message <http://university.us/publications/mellon.pdf>.
```