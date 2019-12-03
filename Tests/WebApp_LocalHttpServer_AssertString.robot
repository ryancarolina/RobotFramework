*** Settings ***
Documentation  This is a basic web UI test on a local web server
Library  Selenium2Library  run_on_failure=Capture Page Screenshot
Library  Process

*** Variables ***
${host}=  http://0.0.0.0:8000/Resources/robotTest.html
${expectedString}=  This is a test page for the robot test framework.
${browserChrome}=  chrome

*** Test Cases ***
A web server is started locally and a string assertion is performed.
    [Documentation]  A web server is started locally on port 8000 and a string from the body of the .html page served is asserted as true.

    ${server}=  start process  python3  -m  http.server
    open browser  ${host}  ${browserChrome}
    wait until page contains  ${expectedString}
    close browser
    sleep  2
    terminate process   ${server}

*** Keywords ***