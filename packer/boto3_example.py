import boto3
from botocore.exceptions import ClientError

with open("hello.txt", "w") as f:
    f.write('Hello World!')

s3Client = boto3.client('s3')

# upload a file
try:
    response = s3Client.upload_file(
        Filename = 'hello.txt',
        Bucket = 'my-test-bucket',
        Key = 'hello.txt',
        ExtraArgs={'ACL': 'public-read'}
    )
    print(response)
except ClientError as e:
    print(e)