*** Settings ***
Documentation  This is a basic web UI test on a local web server
Library  Selenium2Library  run_on_failure=Capture Page Screenshot
Library  Process

*** Variables ***
${host}=  http://0.0.0.0:8000/Resources/robotTest.html
${expectedString}=  This is a test page for the robot test framework.
${expectedError}=  Error code: 404
${browserType}=  chrome
${locateByName_firstName}=  name:firstname
${locateByName_lastName}=  name:lastname
${sendFirstName}=  Ryan
${sendLastName}=  Conklin
${clearPriorText}=  clear=True

*** Test Cases ***
A web server is started locally and two string assertions are performed.
    [Documentation]  A web server is started locally on port 8000 and a string from the body of the .html page served is asserted as true.

    #Setup server and assert a string from the .html body
    ${server}=  start process  python3  -m  http.server
    open browser  ${host}  ${browserType}
    wait until page contains  ${expectedString}

    #Clear the text and enter new string within the first and lastname text fields, finally submit the form
    input text  ${locateByName_firstName}  ${clearPriorText}
    input text  ${locateByName_lastName}  ${clearPriorText}
    click button  Submit

    #Assert an expected 404 error, close the browser, and pause for 2 seconds
    wait until page contains  ${expectedError}
    close browser
    sleep  2

    #Kill the python web server
    terminate process  ${server}

*** Keywords ***