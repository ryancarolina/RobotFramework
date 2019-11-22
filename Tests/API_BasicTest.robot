*** Settings ***
Documentation  API Test
Library  RequestsLibrary

*** Variables ***
${Base_URL}    http://thetestingworldapi.com/

*** Test Cases ***
Get request returns a status 200OK
    [Documentation]  As a user my GET request against /studentsDetails should return a status 200OK
    create session  Get_Student_Details  ${Base_URL}
    ${response}=  get request  Get_Student_Details  api/studentsDetails
    log to console  ${response}

