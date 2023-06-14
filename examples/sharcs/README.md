# SHARCS Example

## Data

- `user.ttl` : a user that wants to login
- `login/` : the context of a logged user
- `organizations/` : known organizations
- `pmp/client.ttl` : known client applications
- `pmp/memberships.ttl` : allowed organization memberships for the PMP
- `pmp/subscriptions.ttl` : allowed subscriptions for the PMP
- `pmp/subscriptions/permissions.ttl` : allowed permissions for the subscriptions
- `pmp/transaction_usage_contract.ttl` : allowed transaction usage contracts for the PMP
- `pmp/transaction_usage_contract/permissions.ttl` : allowed permissions for the transaction usage contracts

## Rules

- `check_login.n3s` : check `user.ttl` against login rules
- `check_session_context_policy_evaluation.n3s` : check `user.ttl` against the subscriptionz permissions
- `check_valid.n3s` : check validity of all steps
  
## Demo

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