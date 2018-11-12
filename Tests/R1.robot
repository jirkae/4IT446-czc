*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open    ${base_url}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Variables ***
${product_id}    ${reference_product_id}

*** Test Cases ***
T1.1.1 - Add To Cart
    Add Product To Cart    ${product_id}
    Page Should Contain Element    xpath=//div[@id='basket-info']//*[contains(@data-item-info, ${product_id})] 
    
T1.1.2 - Product In Cart
    Add Product To Cart    ${product_id}
    Go To    ${url_cart}
    Element Should Contain  ${product_code}  ${product_id}
    
T1.1.3 - Product Bought Text In Detail 
    Add Product To Cart    ${product_id}
    Go To    ${url_cart}
    Go Back   
    Wait Until Page Contains Element    ${btn_buy_in_basket}
    Element Should Contain    ${btn_buy_text}    V košíku 