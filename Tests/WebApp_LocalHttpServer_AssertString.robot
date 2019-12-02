*** Settings ***
Documentation  This is a basic web UI test on a local web server
Library  Selenium2Library

*** Variables ***


*** Test Cases ***
User can open home page
    [Documentation]  As a user I can navigate to the target html page and assert a string from the body.

    open browser    http://0.0.0.0:8000/robotTest.html   chrome
    wait until page contains    This is a test page for the robot test framework.
    close browser

*** Keywords ***
