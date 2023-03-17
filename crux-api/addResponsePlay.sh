#!/bin/bash
API_TOKEN=$1
SERVICE_ID=$2
RESPONSE_PLAY_ID=$3

PD_URL="https://api.pagerduty.com/services/${SERVICE_ID}"

response=$(curl -s --request PUT \
			--url "$PD_URL" \
			--header "authorization: Token token=$API_TOKEN" \
  			--header 'content-type: application/json' \
            --data "{ \
                    \"service\": { \
                        \"response_play\": { \
                            \"id\": \"${RESPONSE_PLAY_ID}\", \
                            \"type\": \"response_play_reference\" \
                        } \
                    } \
                }")

hasError=$(echo -e "$response" | jq '.error')
 
if [ "$hasError" != "null" ];
then
	echo "$hasError"
else
	echo "SUCCESS - Response play added to ${SERVICE_ID}"	 
fi

