*** Settings ***
Library  OperatingSystem
Library  String


*** Variables ***
${expectedContent}=  This is a file content test using robot framework.
${unexpectedContent}=  1 fail failed error


*** Test Cases ***
Assert the contents of a file on the OS.
    [Documentation]  Locate and assert the contents of a file on UNIX OS
    file should exist  /Users/ryan/Desktop/Development/robot_dev/RobotFramework/Resources/osFileTest.txt
    ${actualContent}=  get file  /Users/ryan/Desktop/Development/robot_dev/RobotFramework/Resources/osFileTest.txt
    should contain  ${actualContent}  ${expectedContent}
    should not contain  ${actualContent}  ${unexpectedContent}

*** Keywords ***
