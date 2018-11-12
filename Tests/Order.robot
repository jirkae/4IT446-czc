*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open    ${url}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
T1.1.1 - Add To Bag
    Go To   ${url_stock}
    Add To Cart  ${product_verification}     ${btn_buy}  
    Go Back   
    Wait Until Page Contains Element    ${btn_buy_text}
    Element Should Contain    ${btn_buy_text}    V košíku  

T1.2.1 - One Click Order
    Go To   ${url_stock}
    Wait Until Page Contains Element    ${product_verification}
    Click Element    ${btn_buy_one_click}
    Wait Until Page Contains Element     ${pop_up_window} 

T1.6.1 - Stock at Branch
    Go To   ${url_stock}
    Wait Until Page Contains Element    ${stock_button}
    Click Element    ${stock_button}
    Element Should Be Visible    ${popup}

T2.2.1 - Share Cart
    Go To   ${url_stock}
    Add To Cart  ${product_verification}     ${btn_buy}
    Go To   ${url_cart}
    Wait Until Page Contains Element   ${product_code} 
    Page Should Contain Element     ${product_code}     limit=1
    Element Should Contain  ${product_code}  ${product_code_stock} 
    Go To   ${url_share}
    Wait Until Page Contains Element    ${product_code_share} 
    Page Should Contain Element     ${product_code_share}     limit=1 

T2.3.1 - Add To Bag
    Go To   ${url_stock}
    Add To Cart  ${product_verification}     ${btn_buy}
    Wait Until Page Contains Element    ${bag_money_part}
    Click Element    ${bag_money_part}
    Wait Until Page Contains Element    ${btn_clear_bag}           
    Click Element    ${btn_clear_bag}
    Wait Until Page Contains    Váš nákupní košík je prázdný. 