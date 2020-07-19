*** Settings ***
Documentation       Simple example using SeleniumLibrary.
Library     SeleniumLibrary

Resource        ${CURDIR}/../Engine/Common.robot
Resource        ${CURDIR}/../ObjectRepository/HomePage.robot
Resource        ${CURDIR}/../ObjectRepository/SignIn.robot
Resource        ${CURDIR}/../ObjectRepository/SelectEnvironment.robot

Suite Setup     Set Up
Suite Teardown  Clean Up

Test Template     Drag Drop Item

*** Test Cases ***
TC1     autoqatest100@gmail.com     Password@1      C5 AWS QA

*** Keywords ***
Drag Drop Item
    [Tags]      Success
    [Arguments]     ${username}     ${password}     ${environment}
    Navigate to ${URL}
    Click ${btnMenuSignIn} link

    Login       ${username}     ${password}
    Select Environment      ${environment}

    Sleep       5
    # Drag drop.
    # Assertion.

Login
    [Arguments]     ${username}     ${password}
    Input ${username} into ${txtUsername}
    Input ${password} into ${txtPassword}
    Click ${btnSignIn} button

Select Environment
    [Arguments]     ${environment}
    Wait Until Element Is Visible       ${btnLaunch}      15
    Click ${cmbEnvironment} element
    Click ${liAwsQA} element
    Click ${btnLaunch} button
