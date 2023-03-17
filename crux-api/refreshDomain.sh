export BASE_URL=https://event-sender.herokuapp.com
export URL=${BASE_URL}/api/v1

CRUX_TOKEN=$1
DOMAIN_NAME=$2

DOMAIN_PATH=../crux-api/domainConfig/domains/${DOMAIN_NAME}

#DOMAIN_ID= get the domain ID from the json output file domainDetails.json
DOMAIN_ID=$(cat ${DOMAIN_PATH}/domainDetails.json | jq -r '.id')
echo "[DEBUG] Refreshing Domain ID: ${DOMAIN_ID}"
# refresh a domain
curl -s -H "Authorization: Bearer ${CRUX_TOKEN}" ${URL}/domains/${DOMAIN_ID}/refresh

# "refreshing" value will be false when it's done