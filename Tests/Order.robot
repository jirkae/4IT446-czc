*** Variables ***
${product_id}    ${reference_product_id}
${product_code_share}   xpath=//div[@id='tiles']//div[@data-clipboard='${product_id}']
${url_share}    https://www.czc.cz/${product_id}/kody

*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open    ${base_url}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***

T1.6.1 - Stock at Branch
    Open Product Page    ${product_id}
    Wait Until Page Contains Element    ${stock_button}
    Click Element    ${stock_button}
    Element Should Be Visible    ${popup}

T2.2.1 - Share Cart
    Add Product To Cart    ${product_id}
    Go To   ${url_cart}
    Wait Until Page Contains Element   ${product_code} 
    Page Should Contain Element     ${product_code}     limit=1
    Element Should Contain  ${product_code}  ${product_id}
    Go To   ${url_share}
    Wait Until Page Contains Element    ${product_code_share} 
    Page Should Contain Element     ${product_code_share}     limit=1 

T2.3.1 - Add To Bag
    Add Product To Cart    ${product_id}
    Wait Until Page Contains Element    ${bag_money_part}
    Click Element    ${bag_money_part}
    Wait Until Page Contains Element    ${btn_clear_bag}           
    Click Element    ${btn_clear_bag}
    Wait Until Page Contains    Váš nákupní košík je prázdný. 