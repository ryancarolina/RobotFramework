*** Settings ***
Documentation  API Test
Library  RequestsLibrary

*** Variables ***
${Base_URL}    http://0.0.0.0:8000/

*** Test Cases ***
Get request returns a status 200OK
    [Documentation]  As a user my GET request against /studentsDetails should return a status 200OK
    create session  robotTest.html  ${Base_URL}
    ${response}=  get request  robotTest.html   robotTest.html
    log to console  ${response}