*** Settings ***
Documentation       Simple example using SeleniumLibrary.
Library     SeleniumLibrary

Resource        ${CURDIR}/../Engine/Common.robot
Resource        ${CURDIR}/../ObjectRepository/HomePage.robot
Resource        ${CURDIR}/../ObjectRepository/SignIn.robot
Resource        ${CURDIR}/../ObjectRepository/SelectEnvironment.robot
Resource        ${CURDIR}/../ObjectRepository/ProjectsOrganizer.robot

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
    Drag Project From Folder To Folder      ${liFolder1}        ${liProject1}       ${liFolder2}

    # Assertion.
    Click ${liFolder2} element
    Wait Until Element Is Visible       ${liProject1}      15
    Page Should Contain Element     ${liProject1}
    Page Should Contain Element     ${liProject2}

    # Added wait so that changes can be viewed.
    Sleep       5

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

Drag Project From Folder To Folder
    [Arguments]     ${folder1}      ${project}      ${folder2}
    Wait Until Element Is Visible       ${btnAddFolder}     15
    Wait Until Element Is Visible       ${folder1}      15
    Click ${folder1} element
    Wait Until Element Is Visible       ${project}      15
    Drag ${project} to ${folder2}
    Click ${btnYes} button
    