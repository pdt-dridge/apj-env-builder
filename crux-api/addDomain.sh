#!/bin/bash
export BASE_URL=https://event-sender.herokuapp.com
export URL=${BASE_URL}/api/v1

CRUX_TOKEN=$1
DOMAIN_NAME=$2
PD_API_KEY=$3

# add a PD domain with PD API Key only (automatically refreshes, poll "show a domain" to see when it's done)
curl -s -H "Authorization: Bearer ${CRUX_TOKEN}" ${URL}/domains -X POST -d "{\"name\": \"$DOMAIN_NAME\", \"api_key\": \"$PD_API_KEY\"}"

# {
#   "id": 9,
#   "name": "pdt-sc-env-20210319",
#   "routing_key": null,
#   "created_at": "2020-11-25T16:11:27.000Z",
#   "refreshing": true,
#   "refreshing_message": "Refreshing Domain...",
#   "last_refreshed_at": null
# }


