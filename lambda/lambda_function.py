import json
import boto3
import base64

def lambda_handler(event, context):
    
   s3_client =boto3.client('s3')
   s3_bucket="ci-cd-serverless"
   
   file_content=event["body-json"]
   filename=event["params"]["header"]["filename"]
   
   try:
        s3_upload =s3_client.put_object(Bucket=s3_bucket, Key=filename, Body=file_content)
   except Exception as e:
        raise IOError(e)
   return {
       'statusCode': 200,
       'body': json.dumps(str(filename))
   }
