import base64

def lambda_handler(event, context):
    output = []

    for record in event['records']:
        print(record['recordId'])
        payload = base64.b64decode(record['data'])
        formatted_payload = "{}\n".format(payload)
        output_record = {
            'recordId': record['recordId'],
            'result': 'Ok',
            'data': base64.b64encode(formatted_payload)
        }

        output.append(output_record)

    return {'records': output}
