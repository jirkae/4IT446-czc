*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Product    ${reference_product_id}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Variables ***
${product_id}    ${reference_product_id}
${product_line}    xpath=//*[contains(@data-ga-product, '"id":"${product_id}"')]
${quantity_input}    ${product_line}//*[@name='quantity']

*** Test Cases ***
T2.1.1 - Cart Amount Buttons
    Input Text    ${quantity_input}    1 
    Click Element    ${product_line}//*[@class='up']
    Wait Until Page Contains Element    ${product_line}//*[@name='quantity' and @value='2']
    Click Element    ${product_line}//*[@class='down']
    Wait Until Page Contains Element    ${product_line}//*[@name='quantity' and @value='1']
    
T2.1.1 - Cart Amount Input
    Input Text    ${quantity_input}    3 
    Textfield Value Should Be    ${quantity_input}    3
    Input Text    ${quantity_input}    -5
    Textfield Value Should Be    ${quantity_input}    5