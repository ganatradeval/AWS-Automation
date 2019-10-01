# AWS-Automations
- Remove IAM Roles from Account.

## Remove IAM Roles from account

### Motivation

This may help someone (like me) who is looking for ways to (for instance) delete an IAM Role, 

Removing an IAM role (using Python boto3) is sometime a tedious process as there is not direct API which does that. In addition, it has so many steps which leads us with Exceptions. 
I have faced this issue so I thought of creating this for you.

### Process

1. Remove Role from Instance Profiles.
2. Remove policies attached with Role. (No direct way to list all policies.)
    1. Remove Inline Policies attached with role.
    2. Detach Managed Policies from the role.
3. Finally, Remove Role.
