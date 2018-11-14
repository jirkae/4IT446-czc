*** Variables ***
${product_id}    ${unavailable_product_id}
${unavailable_item}    xpath=//*[contains(@id, 'popup-basket-with-unavailable-item')]

*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Product    ${product_id}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
T1.4.1 - Product Not In Stock
    Wait Until Page Contains Element    ${btn_continue_order}
    Click Element    ${btn_continue_order}
    Wait Until Page Contains Element    ${unavailable_item}
    Page Should Contain Element     ${unavailable_item}
    