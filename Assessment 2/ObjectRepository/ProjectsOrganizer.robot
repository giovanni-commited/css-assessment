*** Settings ***
Documentation       Project Organizer page.

*** Variables ***
${liFolder1}      xpath=//span[@data-tip='Folder 1']
${liProject1}     xpath=//span[@data-tip='Project 1']

${liFolder2}      xpath=//span[@data-tip='Folder 2']
${liProject2}     xpath=//span[@data-tip='Project 2']

${btnAddFolder}     xpath=//button[@seleniumid='addProjectFolder']
${btnAddNewSubFolder}       xpath=//button[@seleniumid='addProjectSubFolder']
${btnAddProject}        xpath=//button[@seleniumid='addProject']

# Confirmation Popup
${btnYes}       xpath=//button/div[text()='Yes']/..
${btnNo}        xpath=//button/div[text()='No']/..