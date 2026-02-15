import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('users')

def lambda_handler(event, context):
    method = event.get('httpMethod')
    
    try:
        if method == 'POST':
            body = json.loads(event['body'])
            table.put_item(Item=body)
            return {'statusCode': 200, 'body': json.dumps('User created')}

        elif method == 'GET':
            user_id = event['queryStringParameters']['id']
            response = table.get_item(Key={'id': user_id})
            return {'statusCode': 200, 'body': json.dumps(response.get('Item', {}))}

        elif method == 'DELETE':
            user_id = event['queryStringParameters']['id']
            table.delete_item(Key={'id': user_id})
            return {'statusCode': 200, 'body': json.dumps('User deleted')}

        return {'statusCode': 400, 'body': json.dumps('Unsupported method')}
        
    except Exception as e:
        return {'statusCode': 500, 'body': json.dumps(str(e))}