#!/bin/bash
export BASE_URL=https://event-sender.herokuapp.com
export URL=${BASE_URL}/api/v1

CRUX_TOKEN=$1
DOMAIN_NAME=$2

DOMAIN_PATH=../crux-api/domainConfig/domains/${DOMAIN_NAME}

#DOMAIN_ID= get the domain ID from the json output file domainDetails.json
DOMAIN_ID=$(cat ${DOMAIN_PATH}/domainDetails.json | jq -r '.id')

sed -i '' s/tech_service_1a_id/${3}/g ${DOMAIN_PATH}/autoResponderSettings.json
sed -i '' s/tech_service_1b_id/${4}/g ${DOMAIN_PATH}/autoResponderSettings.json
sed -i '' s/tech_service_1c_id/${5}/g ${DOMAIN_PATH}/autoResponderSettings.json
sed -i '' s/tech_service_2a_id/${6}/g ${DOMAIN_PATH}/autoResponderSettings.json
sed -i '' s/tech_service_2b_id/${7}/g ${DOMAIN_PATH}/autoResponderSettings.json
sed -i '' s/tech_service_3_id/${8}/g  ${DOMAIN_PATH}/autoResponderSettings.json
sed -i '' s/tech_service_4_id/${9}/g  ${DOMAIN_PATH}/autoResponderSettings.json
sed -i '' s/tech_service_5_id/${10}/g ${DOMAIN_PATH}/autoResponderSettings.json

# set responder settings for a domain
curl -s -H "Authorization: Bearer ${CRUX_TOKEN}" ${URL}/domains/${DOMAIN_ID}/responder_settings -X POST -d @${DOMAIN_PATH}/autoResponderSettings.json
# ok