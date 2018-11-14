*** Variables ***
${product_id}    ${unavailable_product_id}    
${no_delivery_date}    xpath=//*[@class='op-sum-del-pay']//*[@class="content"]//strong

*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Product    ${product_id}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
T1.5.1 - Delivery Date Item Not In Stock
    Wait Until Page Contains Element    ${btn_continue_order}
    Click Element    ${btn_continue_order}
    Wait Until Page Contains Element     ${unavailable_item}
    Click Element    ${btn_agree_unavailable}
    Wait Until Page Contains Element    ${btn_continue_order}
    Click Element    ${btn_continue_order}
    Wait Until Page Contains Element    ${btn_continue_order}
    Click Element    ${btn_continue_order}
    Wait Until Page Contains Element    ${btn_continue_order}    
    Input Text    id=frm-registration.email    xx@xx.xx
    Input Text    id=frm-registration.phoneNumberFormatted    555555555
    Input Text    id=frm-registration.name    xxx
    Input Text    id=frm-registration.surname    xxx
    Input Text    id=frm-registration.street    Ulice 1234/5b
    Input Text    id=frm-registration.city    xxx
    Input Text    id=frm-registration.zipCodeFormatted    10000
    Click Element    ${btn_continue_order}    
    Wait Until Page Contains Element    ${no_delivery_date}
    Page Should Contain Element    ${no_delivery_date}
    