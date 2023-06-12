# SHARCS Example

## Data

- `user.ttl` : a user that wants to login
- `login/contect.ttl` : the context of a logged in user
- `organizations/` : known organizations
- `pmp/client.ttl` : known client applications
- `pmp/memberships.ttl` : allowed organization memberships for the PMP
- `pmp/permissions.ttl` : allowed permissions for the PMP
- `pmp/subscriptions.ttl` : allowed subscriptions for the PMP

## Rules

- `check_login.n3s` : check `user.ttl` against login rules
- `check_permissions.n3s` : checl `user.ttl` against the permissions
  
## Demo

```
./test.sh
@prefix ex: <http://www.example.org/rdf#>.
@prefix log: <http://www.w3.org/2000/10/swap/log#>.

ex:Login ex:as ex:user1.
ex:Login ex:isValidLogin true.
ex:Login ex:membership ex:ABCMembership.
ex:Login ex:organization ex:ABC.
ex:Login ex:isValidMembership true.
ex:Login ex:isValidOrganization true.
ex:Login ex:clientSubcription ex:DataConsumerClient01.
ex:Login ex:isValidSubscription true.
ex:Login ex:permission ex:ABCPermission.
ex:Login ex:isValidPermission true.
```