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

Get request against /profile/2 returns a JSON payload equal to Luke
    create session  json-server  ${baseUrl}
    ${response}=  get request  json-server  /profile/2
    should be equal as strings  ${response.status_code}  200
    dictionary should contain value  ${response.json()}  Luke
    log to console  ${response.json()}

Post request against /profile returns 201OK and creates a new profile
    create session  json-server  ${baseUrl}
    &{body}=  create dictionary  id=6  name=Darth
    &{header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  json-server  /profile  data=${body}  headers=${header}
    should be equal as strings  ${response.status_code}  201
    log to console  ${response.content}

Delete request against /profile/6 returns successful and removes profile ID:6
    create session  json-server  ${baseUrl}
    ${response}=  delete request  json-server  /profile/6
    should be equal as strings  ${response.status_code}  200
    log to console  ${response.content}

#Put request against /profile/2 returns 201 and updates the profile
#    create session  json-server  ${baseUrl}
#    &{body}=  create dictionary  name=LUKE
#    &{header}=  create dictionary  Content-Type=application/json
#    ${response}=  post request  json-server  /profile  data=${body}  headers=${header}
#    should be equal as strings  ${response.status_code}  201
#    log to console  ${response.content}
