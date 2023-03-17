#!/bin/bash
CRUX_TOKEN=$1
DOMAIN_NAME=$2
PD_API_KEY=$3

mkdir -p ../crux-api/domainConfig/domains/${DOMAIN_NAME}

cp -n ../crux-api/domainConfig/template/autoResponderSettings.json ../crux-api/domainConfig/domains/${DOMAIN_NAME}/
cp -n ../crux-api/domainConfig/template/eventGroupConfig.json ../crux-api/domainConfig/domains/${DOMAIN_NAME}/

../crux-api/addDomain.sh ${CRUX_TOKEN} ${DOMAIN_NAME} ${PD_API_KEY} > ../crux-api/domainConfig/domains/${DOMAIN_NAME}/domainDetails.json

## output to domainDetails.json as we need the id for autoResponderSettings
# {
#   "id": 9,
#   "name": "pdt-sc-env-20210319",
#   "routing_key": null,
#   "created_at": "2020-11-25T16:11:27.000Z",
#   "refreshing": true,
#   "refreshing_message": "Refreshing Domain...",
#   "last_refreshed_at": null
# }
