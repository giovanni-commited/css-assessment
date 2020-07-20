*** Settings ***
Library           OperatingSystem

Resource        ../Helpers/Helpers.robot

*** Variables ***
${BROWSER}      Chrome

*** Keywords ***
Set Up
    [Documentation]     Set up before tests run.
    ${DriverPath}=      Get ${BROWSER} Driver
    Create Webdriver        ${BROWSER}      executable_path=${DriverPath}

Clean Up
    [Documentation]     Clean up for when tests are completed.
    Close Browser

Navigate to ${site}
    [Documentation]     Navigation to website.
    Go To    ${site}

Input ${value} into ${field}
    [Documentation]     Enter value into input field.
    Input Text      ${field}        ${value}

Click ${control} button
    [Documentation]     Click specified button.
    Click Button        ${control}

Click ${control} link
    [Documentation]     Click specified link.
    Click Link      ${control}

Click ${control} element
    [Documentation]     Click specified element.
    Click Element       ${control}

Select ${value} from ${field} dropdown
    [Documentation]     Select a value from the dropdown.
    Select From List By Label       ${field}        ${value}

Select ${value} from ${group} radio button group
    [Documentation]     Select a radio button from the specified group.
    Click Element        xpath=//input[@name="${group}" and @value=${value}]

Drag ${item} to ${folder}
    [Documentation]     Drag an item from one location to another location.
    Assign Id To Element        ${item}     project1id
    Assign Id To Element        ${folder}       folder2id

    ${jQuery}=      Get File        ./Libs/jquery_load_helper.js
    Execute Async Javascript        ${jQuery}

    ${js}=      Get File        ./Libs/drag_and_drop_helper.js
    Execute Javascript      ${js} $('#project1id').simulateDragDrop({ dropTarget: '#folder2id'});

Validate that ${field} contains ${value}
    [Documentation]     Validate that the text entered in the element is what is expected.
    Element Text Should Be      ${field}        ${value}
