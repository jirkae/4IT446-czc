*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open    ${url}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
Test Funkcnosti
    Wait Until Page Contains Element    ${logo}