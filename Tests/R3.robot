*** Variables ***
${product_id}    ${reference_product_id}

*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Product    ${product_id}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
T2.1.1 - Insurance Options Visibility
    Page Should Contain Element    xpath=//*[contains(@name, 'extended-warranty')]
    Page Should Contain Element    xpath=//*[contains(@name, 'mobile-phones-damage-theft')]    
    
T2.1.1 - Order Price Increase    
    ${price}=    Get Text    xpath=//*[@class='total-price']/*[@class='price-vatin']/*[@class='money-part']
    ${price_int}=    Replace String Using Regexp    ${price}    \\D    ${EMPTY}
    ${warranty_price}=    Get Text     xpath=//*[contains(@name, 'extended-warranty') and not(@data-si-remote-id='no-extendedwarranty')][1]/following-sibling::label[1]//*[@class='money-part']
    ${warranty_price}=    Replace String Using Regexp    ${warranty_price}    \\D    ${EMPTY}
    ${warranty_price}=    Set Variable    2799
    Click Element    xpath=//*[contains(@name, 'extended-warranty')]/following-sibling::label[1]
    Wait Until Page Contains Element    xpath=//*[@class='total-price']/*[@class='price-vatin']/span[not(contains(text(),'${price}')) and contains(text(),'Kč')]    
    ${end_order_price}=    Get Text    xpath=//*[@class='total-price']/*[@class='price-vatin']/*[@class='money-part']
    ${end_order_price}=    Replace String Using Regexp    ${end_order_price}    \\D    ${EMPTY}
    ${price_int}    Evaluate    ${price_int} + ${warranty_price}    
    Should Be Equal    ${end_order_price}    ${price_int}        
    