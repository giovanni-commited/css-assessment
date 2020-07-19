*** Settings ***
Documentation       Select environment page.

*** Variables ***
${cmbEnvironment}     xpath=//div[text()='C5 AWS QA']
${liAwsQA}      xpath=//li[@seleniumId='C5-option-1']
${btnLaunch}      xpath=//button[@seleniumid='C5']
