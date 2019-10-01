# AWS-Automations
- Remove IAM Roles from Account.

## Remove IAM Roles from account

### Motivation

This may help someone (like me) who is looking for ways to (for instance) delete an IAM Role. There is not single API which does all this things currently (except AWS Console).

Removing an IAM role (using Python boto3) is sometime a tedious process as there is not direct API which does that. In addition, it has so many steps which leads us with Exceptions. 
I have faced this issue so I thought of creating this for you.

### Process

1. Remove Role from Instance Profiles. 
2. Remove policies attached with Role. (No direct way to list all policies.) [List instance profiles for role](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/iam.html#IAM.Client.list_instance_profiles_for_role)
    1. Remove Inline Policies attached with role. [List role policies API](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/iam.html#IAM.Client.list_role_policies)
    2. Detach Managed Policies from the role. [List attached role policy API](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/iam.html#IAM.Client.list_attached_role_policies)
3. Finally, Remove Role.

You can also use [Paginators](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/iam.html#paginators) for this. I haven't added to make it easily understandable.
