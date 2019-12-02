*** Settings ***
Documentation  This is a basic test
Library  Selenium2Library
Documentation  This is a basic web UI test
Library  Selenium2Library

*** Variables ***


*** Test Cases ***
User can open home page
    [Documentation]  As a user I can open the home page and view the tagline

    open browser    https://expansiagroup.com   chrome
    wait until page contains    Real Solutions to Real Problems
    close browser

*** Keywords ***
