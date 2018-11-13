*** Variables ***
${product_id}    ${reference_product_id}

*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Product    ${product_id}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
T2.1.1 - Insurance Options Visibility
    Page Should Contain Element    ${discount_cupons}
    Input Text    ${discount_cupons}    ${invalid_code}
    Click Element    ${discount_cupons_send}
    Wait Until Page Contains Element    ${discount_cupons_error}    