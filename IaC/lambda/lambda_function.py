import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('counter-keeper-for-crc')

def lambda_handler(event, context):
    # Retrieve the current value of "Views"
    response = table.get_item(Key={
        'Identifier': 'Views'
    })
    
    # Extract the current view count
    current_value = int(response['Item']['Value'])
    
    # Increment the view count
    new_value = current_value + 1
    print(f"Updated Views: {new_value}")
    
    # Update the item in the table with the new view count
    table.put_item(Item={
        'Identifier': 'Views',
        'Value': str(new_value)  # DynamoDB expects strings for number type
    })
    
    # Return the updated view count
    return {
        'statusCode': 200,
        'body': json.dumps(new_value)
    }