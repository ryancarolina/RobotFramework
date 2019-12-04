*** Settings ***
Documentation  API Test
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${baseUrl}=  http://localhost:3000

*** Test Cases ***
Get request against base url returns a status 200OK
    create session  json-server  ${baseUrl}
    ${response}=  get request  json-server  /
    should be equal as strings  ${response.status_code}  200

Get request against /posts returns a status 200OK
    create session  json-server  ${baseUrl}
    ${response}=  get request  json-server  /posts
    should be equal as strings  ${response.status_code}  200

Get request against /comments returns a status 200OK
    create session  json-server  ${baseUrl}
    ${response}=  get request  json-server  /comments
    should be equal as strings  ${response.status_code}  200

Get request against /profile returns a status 200OK
    create session  json-server  ${baseUrl}
    ${response}=  get request  json-server  /profile
    should be equal as strings  ${response.status_code}  200

Get request against /profile/1 returns a JSON payload equal to Yoda
    create session  json-server  ${baseUrl}
    ${response}=  get request  json-server  /profile/1
    should be equal as strings  ${response.status_code}  200
    dictionary should contain value  ${response.json()}  Yoda
    log to console  ${response.json()}

#Post request against /profile returns 201OK and creates a new profile
#    create session  json-server  ${baseUrl}
#    &{body}=  create dictionary  id=5  name=C3PO
#    &{header}=  create dictionary  Content-Type=application/json
#    ${response}=  post request  json-server  /profile  data=${body}  headers=${header}
#    should be equal as strings  ${response.status_code}  201
#    log to console  ${response.content}

#Delete request against /profile/3 returns successful and removes profile ID:3
#    create session  json-server  ${baseUrl}
#    ${response}=  delete request  json-server  /profile/3
#    should be equal as strings  ${response.status_code}  200
#    log to console  ${response.content}
