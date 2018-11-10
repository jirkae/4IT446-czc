*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open    ${url}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
Req01 - Add To Bag
    Go To   ${url_stock}
    Wait Until Page Contains Element    ${product_verification}
    Click Button    ${btn_buy} 
    Wait Until Page Contains    Zboží jsme vložili do košíku    
    Go Back   
    Wait Until Page Contains Element    ${btn_buy_text}
    Element Should Contain    ${btn_buy_text}    V košíku  

Req02 - One Click Order
    Go To   ${url_stock}
    Wait Until Page Contains Element    ${product_verification}
    Click Element    ${btn_buy_one_click}
    Wait Until Page Contains Element     ${pop_up_window} 

Req14 - Add To Bag
    Go To   ${url_stock}
    Wait Until Page Contains Element    ${product_verification}
    Click Button    ${btn_buy} 
    Wait Until Page Contains    Zboží jsme vložili do košíku
    Wait Until Page Contains Element    ${bag_money_part}
    Click Element    ${bag_money_part}
    Wait Until Page Contains Element    ${btn_clear_bag}           
    Click Element    ${btn_clear_bag}
    Wait Until Page Contains    Váš nákupní košík je prázdný. 