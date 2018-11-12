*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open    ${base_url}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Variables ***
${product_id}    ${reference_product_id}

*** Test Cases ***
T2.1.1 - Add To Cart
    Open Product Page    ${product_id}
    Click Element    ${btn_buy_one_click}
    Wait Until Page Contains Element     ${pop_up_window} 