import boto3

def cleanup(roleName):
    try:
        iamClient = boto3.client('iam')

        managedPolicy = iam.list_attached_role_policies(RoleName=roleName)
        for each in managedPolicy['AttachedPolicies']:
            print("Detaching ", each)
            iamClient.detach_role_policy(RoleName=roleName, PolicyArn=each['PolicyArn'])

        inlinePolicy = iam.list_role_policies(RoleName=roleName)
        for each in inlinePolicy['PolicyNames']:
            print("Deleting ", each)
            iamClient.delete_role_policy(RoleName=roleName,PolicyName=each)

        instanceProfiles = iam.list_instance_profiles_for_role(RoleName=roleName)
        for each in instanceProfiles['InstanceProfiles']:
            print("Removing role from instance profile ", each)
            iamClient.remove_role_from_instance_profile(RoleName = roleName,InstanceProfileName=each['InstanceProfileName'])
        iamClient.delete_role(RoleName=roleName)
    except Exception as error:
        print("There is some problem while deleting IAM Role", error)
