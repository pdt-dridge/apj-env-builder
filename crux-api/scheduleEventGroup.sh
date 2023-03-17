#!/bin/bash
export BASE_URL=https://event-sender.herokuapp.com
export URL=${BASE_URL}/api/v1

CRUX_TOKEN=$1
DOMAIN_NAME=$2

DOMAIN_PATH=../crux-api/domainConfig/domains/${DOMAIN_NAME}

sed -i '' s/domain_name/${DOMAIN_NAME}/g ${DOMAIN_PATH}/eventGroupConfig.json

sed -i '' s/tech_service_1a_key/${3}/g ${DOMAIN_PATH}/eventGroupConfig.json
sed -i '' s/tech_service_1b_key/${4}/g ${DOMAIN_PATH}/eventGroupConfig.json
sed -i '' s/tech_service_1c_key/${5}/g ${DOMAIN_PATH}/eventGroupConfig.json
sed -i '' s/tech_service_2a_key/${6}/g ${DOMAIN_PATH}/eventGroupConfig.json
sed -i '' s/tech_service_2b_key/${7}/g ${DOMAIN_PATH}/eventGroupConfig.json
sed -i '' s/tech_service_3_key/${8}/g  ${DOMAIN_PATH}/eventGroupConfig.json
sed -i '' s/tech_service_4_key/${9}/g  ${DOMAIN_PATH}/eventGroupConfig.json
sed -i '' s/tech_service_5_key/${10}/g ${DOMAIN_PATH}/eventGroupConfig.json

# import event groups and retrieve the id
EVENT_GROUP_ID=$(curl -s -H "Authorization: Bearer ${CRUX_TOKEN}" ${URL}/events/import -X POST -d @${DOMAIN_PATH}/eventGroupConfig.json | jq -r '.[].event_group.id')

echo "[DEBUG] Event Group Imported... EVENT_GROUP_ID=${EVENT_GROUP_ID}"

# schedule the newly imported event group
curl -s -H "Authorization: Bearer ${CRUX_TOKEN}" ${URL}/event_groups/${EVENT_GROUP_ID}/schedule \
 -X POST \
 -d "{ \"schedule_type\": \"every\", \
	   \"schedule\": \"12 hours\", \
	   \"times\": \"365\" \
	}"
