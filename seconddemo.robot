*** Settings ***
Documentation    To open a Online webpage and validate
Library        SeleniumLibrary
Test Teardown    Close Browser
Resource        resource.robot


*** Variables ***
${Error_Message}    css:#main-panel > div > form > div.app-sign-in-register__error
*** Test Cases ***
validate successfull login event into jenkins
    Open the browser with localhost jenkins url
    Fill the login form with username and password
    wait for the login form to validate
    verify the homepage

#/Users/santhoshraman/Downloads/chromedriver-mac-x64\
*** Keywords ***
Open the browser with localhost jenkins url
    Open Browser    http://localhost:8080/login?from=%2F    chrome
    /Users/santhoshraman/PycharmProjects/robotpoc/Robotframeworkpoc/Tests/firstdemo.robot

Fill the login form with username and password
    Input Text        id:j_username    sraman
    Input Password    id:j_password    123
    Click Button   xpath=//*[@id="main-panel"]/div/form/button

wait for the login form to validate
    Wait Until Element Is Visible    xpath://*[@id="main-panel"]/div/form/div[1]
    Sleep    5 seconds

verify the homepage
    ${result} =    Get Text    ${Error_Message}
    Should Be Equal    ${result}    Invalid username or password

