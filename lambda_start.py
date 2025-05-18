import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')

    filters = [{'Name': 'tag:AutoStartStop', 'Values': ['true']}]
    instances = ec2.describe_instances(Filters=filters)

    instance_ids = [
        instance['InstanceId']
        for reservation in instances['Reservations']
        for instance in reservation['Instances']
        if instance['State']['Name'] == 'stopped'
    ]

    if instance_ids:
        print(f"Starting instances: {instance_ids}")
        ec2.start_instances(InstanceIds=instance_ids)
    else:
        print("No stopped instances found.")
