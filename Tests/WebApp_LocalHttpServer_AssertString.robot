*** Settings ***
Documentation  This is a basic web UI test on a local web server
Library  Selenium2Library
Library  Process
Suite Teardown    Terminate All Processes    kill=True

*** Variables ***


*** Test Cases ***
A web server is started locally on port 8000 and a string assertion is performed.
    [Documentation]  A web server is started locally on port 8000 and a string from the body of the .html page served is asserted as true.

    ${handle}=  start process  python3  -m  http.server
    open browser    http://0.0.0.0:8000/Resources/robotTest.html   chrome
    wait until page contains    This is a test page for the robot test framework.
    close browser
    sleep  2
    terminate process   ${handle}
    ${result}=  terminate all processes
    
*** Keywords ***