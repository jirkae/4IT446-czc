*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open    ${base_url}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Variables ***
${product_id}    ${one_click_product_id}

*** Test Cases ***
T2.1.1 - One Click Purchase
    Open Product Page    ${product_id}
    Click Element    ${btn_buy_one_click}
    Wait Until Page Contains Element     ${one_click_pop_up_window} 
    Page Should Contain Element    id=frm-storeId
    Page Should Contain Element    xpath://*[@id='popup-reservation']//button[contains(@class, 'btn-purchase')]