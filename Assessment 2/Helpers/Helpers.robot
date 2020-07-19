*** Settings ***
Library     String
Library     JSONLibrary

*** Keywords ***
Get ${driver} driver
    [Documentation]     Get specified driver.
    Return from keyword if      '${driver}' == 'Chrome'     ./Drivers/chromedriver.exe
