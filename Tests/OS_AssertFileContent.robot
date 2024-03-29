*** Settings ***
Library         OperatingSystem
Library         String

*** Variables ***
${expectedContent}  This is a file content test using robot framework.
${unexpectedContent}  1 fail failed error

*** Test Cases ***
Assert the contents of a file on the OS.
    [Documentation]  Locate and assert the contents of a file on OS
    file should exist  ../RobotFramework/Resources/osFileTest.txt
    ${actualContent}=  get file  ../RobotFramework/Resources/osFileTest.txt
    should contain  ${actualContent}  ${expectedContent}
    should not contain  ${actualContent}  ${unexpectedContent}
*** Keywords ***
