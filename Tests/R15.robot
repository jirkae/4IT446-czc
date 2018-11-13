*** Variables ***
${product_id}    ${reference_product_id}

*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Product    ${product_id}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
T2.1.1 - Insurance Options Visibility
    Go To   ${url_delivery_payments}
    Wait Until Page Contains Element    xpath=//button[contains(@class, 'btn-purchase')]         
    Click Element    xpath=//button[contains(@class, 'btn-purchase')]
    Go To    ${url_cart_addresses}
    Wait Until Page Contains Element    ${delivery_informations_form}
    Click Element    xpath=//button[contains(@class, 'btn-purchase')]
    Page Should Contain Element    xpath=//input[contains(@class,'input-error')]
    Input Text    id=frm-registration.email    xx
    Input Text    id=frm-registration.phoneNumberFormatted    xx
    Input Text    id=frm-registration.name    xx
    Input Text    id=frm-registration.surname    xx
    Input Text    id=frm-registration.street    xx
    Input Text    id=frm-registration.city    xx
    Input Text    id=frm-registration.zipCodeFormatted    xx
    Click Element    xpath=//button[contains(@class, 'btn-purchase')]    