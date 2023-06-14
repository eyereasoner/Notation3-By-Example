# SHARCS Example

SHARCS example is a collection of data, rules and validation steps to
simulate at data clearning house use-case.

The **Knowledge Base** collection contains zero or more data resources that are 
available in the context of the clearning house.

The **Policies** collection contain zero or more policy rules that need
to be checked for the context.

The **Validation** contains validation steps that evaluate the output of
the policy rules.

The SHARCS implementation has two reasoning runs: one for applying the policies on the knowledge base, one for applying the results of the policies on the validation step.

```
[KnowledgeBase] --> 
  {Reasoning with [Policies] + [Query]} --> 
  {Reasoning with [Validation] + [Query]} -->
  [Output]
```

## Knowledge Base

- `user.ttl` : a user that wants to login
- `login/` : the context of a logged user
- `organizations/` : known organizations
- `pmp/client.ttl` : known client applications
- `pmp/memberships.ttl` : allowed organization memberships for the PMP
- `pmp/subscriptions.ttl` : allowed subscriptions for the PMP
- `pmp/subscriptions/permissions.ttl` : allowed permissions for the subscriptions
- `pmp/transaction_usage_contract.ttl` : allowed transaction usage contracts for the PMP
- `pmp/transaction_usage_contract/permissions.ttl` : allowed permissions for the transaction usage contracts

## Policies

- `policies/check_login.n3s` : check `user.ttl` against login rules
- `policies/check_session_context_policy_evaluation.n3s` : check `user.ttl` against the subscriptionz permissions
- `policies/query.n3s` : a template which data from the knowledge base can be send to the validation step

## Validation 
- `validation/valid_classes.n3s` : check if all required classes are available in the Login session
- `validation/query.n3s` : a template which data can be sent to the output

## Demo

Run all the reasoning steps as described above:

```
$ ./test.sh
@prefix ex: <http://www.example.org/rdf#>.
@prefix log: <http://www.w3.org/2000/10/swap/log#>.

ex:MyTest a ex:Login.
ex:MyTest a ex:ValidLogin.
ex:MyTest a ex:ValidMembership.
ex:MyTest a ex:ValidOrganization.
ex:MyTest a ex:ValidSubscription.
ex:MyTest a ex:ValidPermission.
ex:MyTest a ex:ValidAll.
ex:MyTest ex:as ex:user1.
ex:MyTest ex:user ex:user1.
ex:MyTest ex:subscription ex:ABCSubscription.
ex:MyTest ex:membership ex:ABCMembership.
ex:MyTest ex:organization ex:ABC.
ex:MyTest ex:clientSubscription ex:DataConsumerClient01.
ex:MyTest ex:permission ex:ABCSubscriptionPermission.
```