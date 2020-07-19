*** Settings ***
Documentation       Sign in page for CSS website.

*** Variables ***
${txtUsername}      xpath=//input[@id='emailSignIn']
${txtPassword}      xpath=//input[@id='passwordSignIn']
${btnSignIn}        xpath=//button[contains(@class, ' signInButton')]
${btnForgotPassword}        xpath=//a[@href='#/resetpassword']
