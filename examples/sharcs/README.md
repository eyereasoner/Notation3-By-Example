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
```