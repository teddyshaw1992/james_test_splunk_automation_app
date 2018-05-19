#!/bin/bash

JIRA_USERNAME="j.a.shaw@accenture.com"
JIRA_PASSWORD="1992JamesShawAtlassian!"
JIRA_TRANSITION_ID="101"
JIRA_SERVER_URL="https://acnaop.atlassian.net"
JIRA_REST_API_CALL_URL="${JIRA_SERVER_URL}/rest/api/latest/issue/"
JIRA_ID_IN_BRANCH="CRYS-15"


#HTTP_TRANSITION_STATUS_CODE=$( curl -s -o /dev/null -w '%{http_code}' -u "j.a.shaw@accenture.com:1992JamesShawAtlassian!" -X POST --data '{"transition": {"id": "'${JIRA_TRANSITION_ID}'"}}' -H "Content-Type: application/json" https://acnaop.atlassian.net/rest/api/latest/issue/CRYS-14/transitions?expand\=transitions.fields )

#HTTP_TRANSITION_STATUS_CODE=$( curl -s -o /dev/null -w '%{http_code}' -u "j.a.shaw@accenture.com:1992JamesShawAtlassian!" -X POST --data '{"transition": {"id": "'${JIRA_TRANSITION_ID}'"}}' -H "Content-Type: application/json" https://acnaop.atlassian.net/rest/api/latest/issue/CRYS-15/transitions?expand\=transitions.fields )

#HTTP_TRANSITION_STATUS_CODE=$( curl -s -o /dev/null -w '%{http_code}' -u "${JIRA_USERNAME}:${JIRA_PASSWORD}" -X POST --data '{"transition": {"id": "'${JIRA_TRANSITION_ID}'"}}' -H "Content-Type: application/json" https://acnaop.atlassian.net/rest/api/latest/issue/CRYS-15/transitions?expand\=transitions.fields )

#HTTP_TRANSITION_STATUS_CODE=$( curl -s -o /dev/null -w '%{http_code}' -u "${JIRA_USERNAME}:${JIRA_PASSWORD}" -X POST --data '{"transition": {"id": "'${JIRA_TRANSITION_ID}'"}}' -H "Content-Type: application/json" https://acnaop.atlassian.net/rest/api/latest/issue/${JIRA_ID_IN_BRANCH}/transitions?expand\=transitions.fields )

#HTTP_TRANSITION_STATUS_CODE=$( curl -s -o /dev/null -w '%{http_code}' -u "${JIRA_USERNAME}:${JIRA_PASSWORD}" -X POST --data '{"transition": {"id": "'${JIRA_TRANSITION_ID}'"}}' -H "Content-Type: application/json" ${JIRA_REST_API_CALL_URL}${JIRA_ID_IN_BRANCH}/transitions?expand\=transitions.fields )

HTTP_TRANSITION_STATUS_CODE=$( curl -s -o /dev/null -w '%{http_code}' -u "${JIRA_USERNAME}:${JIRA_PASSWORD}" -X POST --data '{"transition": {"id": "'${JIRA_TRANSITION_ID}'"}}' -H "Content-Type: application/json" "${JIRA_REST_API_CALL_URL}${JIRA_ID_IN_BRANCH}/transitions?expand=transitions.fields" )


#HTTP_TRANSITION_STATUS_CODE=$( curl -s -o /dev/null -w '%{http_code}' -u "${JIRA_USERNAME}:${JIRA_PASSWORD}" -X POST --data '{"transition": {"id": "'${JIRA_TRANSITION_ID}'"}}' -H "Content-Type: application/json" ${JIRA_REST_API_CALL_URL}${JIRA_ID_IN_BRANCH}/transitions?expand\=transitions.fields )



#HTTP_TRANSITION_STATUS_CODE=$(curl -s -o /dev/null -w '%{http_code}' -u ${JIRA_USERNAME}:${JIRA_PASSWORD} -X POST --data '{"transition": {"id": "241"}}
#' -H "Content-Type: application/json" "${JIRA_REST_API_CALL_URL}${JIRA_ID_IN_BRANCH}/transitions?expand=transitions.fields" )

if [ ${HTTP_TRANSITION_STATUS_CODE} == "201" ]; then
  echo "JIRA Status Updated"
else
  echo "Error: Failed to update JIRA status."
  echo "HTTP Error code: ${HTTP_TRANSITION_STATUS_CODE}"
  echo "Username: ${JIRA_USERNAME}"
  #echo "Password: ${JIRA_PASSWORD}"
  echo "Branch ID: ${JIRA_ID_IN_BRANCH}"
  echo "Comment Message:"
  echo "${JIRA_TRANSITION_ID}"
fi

