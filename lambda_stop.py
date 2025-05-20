import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')

    filters = [{'Name': 'tag:AutoStartStop', 'Values': ['true']}]

    try:
        response = ec2.describe_instances(Filters=filters)
        instance_ids = []

        for reservation in response['Reservations']:
            for instance in reservation['Instances']:
                print(f"Found instance: {instance['InstanceId']} (state: {instance['State']['Name']})")
                if instance['State']['Name'] == 'running':
                    instance_ids.append(instance['InstanceId'])

        if instance_ids:
            print(f"Stopping instances: {instance_ids}")
            ec2.stop_instances(InstanceIds=instance_ids)
        else:
            print("No running instances found with tag AutoStartStop=true")

    except Exception as e:
        print(f"Error: {str(e)}")
