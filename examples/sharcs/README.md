# SHARCS Example

SHARCS example is a collection of data, rules and validation steps to simulate a data clearning house use-case.

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

The data file `data.ttl` contains the knowledge base. When a PMP session is started it is imagined that the service can get access to the grants, organizations, client information, memberships, subscriptions and transaction usage contracts. How this information is gathered is out of scope for this experiment.

## Policies

The policies are written in the first-order logic from of [RDF Surfaces](https://w3c-cg.github.io/rdfsurfaces/). Each policy has access to all
the data in the knowledge base (all `.ttl` files in this example). Based
on this data implications can be written:

```
ForAll X : X has property IMPLIES X a ValidSubject
```

Policies can be written independent from eachother. Each policy adds a
`Valid*` class to the login session when the policy holds.

A validation run will check if a login session contains all the required `Valid*` classes and proposes a next action: e.g. `AllowService` or `DenyService`.

- `policies/query.n3s` : a template which data from the knowledge base can be send to the validation step

### Data Consumer

- `policies/data_consumer/check_login.n3s` : check `user.ttl` against login rules
- `policies/data_consumer/check_session_context_policy_evaluation.n3s` : check `user.ttl` against the subscription permissions

### Data Provider

- `policies/data_provider/checl_login.n3s` : check `user.ttl` against login rules
- `policies/data_provider/check_access_grant_policy_evaluation.n3s` : check `user.ttl` against the grant policy evaluation
- `policies/data_provider/check_transaction_usage_contract_policy_evaluation.n3s` : check the `user.ttl` against the transaction usage contract

## Validation 

- `validation/validator.n3s` : rules to execute valid_classes
- `validation/query.n3s` : a template which data can be sent to the output

### Data Consumer

- `validation/data_consumer/valid_classes.n3s` : check if all required classes are available in the Login session
- `validation/data_consumer/policies/check_consistency.n3s` : consistency checks

### Data Provider

- `validation/data_provider/valid_classes.n3s` : check if all required classes are available in the Login session
- `validation/data_provider/policies/check_consistency.n3s` : consistency checks

## Demo Data Consumer 

Run all the reasoning steps as described above using a simulated Data Consumer session:

```
$ ./data_consumer_session.sh
@prefix ex: <http://www.example.org/rdf#>.
@prefix log: <http://www.w3.org/2000/10/swap/log#>.
@prefix list: <http://www.w3.org/2000/10/swap/list#>.

ex:MyTest a ex:Login.
ex:MyTest a ex:ValidLogin.
ex:MyTest a ex:ValidMembership.
ex:MyTest a ex:ValidOrganization.
ex:MyTest a ex:ValidSubscription.
ex:MyTest a ex:ValidPermission.
ex:MyTest ex:as ex:user1.
ex:MyTest ex:user ex:user1.
ex:MyTest ex:subscription ex:ABCSubscription.
ex:MyTest ex:membership ex:ABCMembership.
ex:MyTest ex:organization ex:ABC.
ex:MyTest ex:clientSubscription ex:DataConsumerClient01.
ex:MyTest ex:permission ex:ABCSubscriptionPermission.
ex:MyTest ex:action ex:AllowService.
```

The output of both reasoning steps are also written in file files:

- `data_consumer_session.step1.ttl`
- `data_consumer_session.step2.ttl`

As test one can inactive one of the data sources. E.g. set `pmp/subscription/permissions.ttl` the `ex:ABCSubscriptionPermission ex:isActive false` and run the test again:

```
$ ./data_consumer_session.sh
@prefix log: <http://www.w3.org/2000/10/swap/log#>.
@prefix list: <http://www.w3.org/2000/10/swap/list#>.

ex:MyTest a ex:Login.
ex:MyTest a ex:ValidLogin.
ex:MyTest a ex:ValidMembership.
ex:MyTest a ex:ValidOrganization.
ex:MyTest a ex:ValidSubscription.
ex:MyTest ex:as ex:user1.
ex:MyTest ex:user ex:user1.
ex:MyTest ex:subscription ex:ABCSubscription.
ex:MyTest ex:membership ex:ABCMembership.
ex:MyTest ex:organization ex:ABC.
ex:MyTest ex:clientSubscription ex:DataConsumerClient01.
ex:MyTest ex:action ex:DenyService.
ex:MyTest ex:missing ex:ValidPermission.
```

## Demo Data Provider

Run all the reasoning steps as described above using a simulated Data Provider session:

```
$ ./data_provider_session.sh
@prefix log: <http://www.w3.org/2000/10/swap/log#>.
@prefix list: <http://www.w3.org/2000/10/swap/list#>.

ex:MyTestProvider a ex:ProviderSession.
ex:MyTestProvider a ex:ValidAccessGrant.
ex:MyTestProvider a ex:ValidLogin.
ex:MyTestProvider a ex:ValidTransactionUsageContract.
ex:MyTestProvider a ex:ValidPermission.
ex:MyTestProvider ex:user ex:user1.
ex:MyTestProvider ex:client ex:DataProviderClient01.
ex:MyTestProvider ex:membership ex:ABCMembership.
ex:MyTestProvider ex:contract ex:ABCContract.
ex:MyTestProvider ex:grant ex:AccessGrant123.
ex:MyTestProvider ex:action ex:AllowService.
```

The output of both reasoning steps are also written in file files:

- `data_provider_session.step1.ttl`
- `data_provider_session.step2.ttl`

We can invalide this process by, for instance, commenting out the access grant in `grant/client1.ttl` and run the `data_provider_session.sh` again:

```
$ ./data_provider_session.sh
@prefix log: <http://www.w3.org/2000/10/swap/log#>.
@prefix list: <http://www.w3.org/2000/10/swap/list#>.

ex:MyTestProvider a ex:ProviderSession.
ex:MyTestProvider a ex:ValidLogin.
ex:MyTestProvider a ex:ValidTransactionUsageContract.
ex:MyTestProvider a ex:ValidPermission.
ex:MyTestProvider ex:user ex:user1.
ex:MyTestProvider ex:client ex:DataProviderClient01.
ex:MyTestProvider ex:membership ex:ABCMembership.
ex:MyTestProvider ex:contract ex:ABCContract.
ex:MyTestProvider ex:action ex:DenyService.
ex:MyTestProvider ex:missing ex:ValidAccessGrant.
```