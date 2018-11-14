*** Variables ***
${product_id}    ${reference_product_id}
${xpath_warranty_label}    xpath=//*[contains(@name, 'extended-warranty') and not(@data-si-remote-id='no-extendedwarranty')]/following-sibling::label[1]

*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Product    ${product_id}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
T1.3.1 - Insurance Options Visibility
    Page Should Contain Element    xpath=//*[contains(@name, 'extended-warranty')]
    Page Should Contain Element    xpath=//*[contains(@name, 'mobile-phones-damage-theft')]    
    
T1.3.2 - Order Price Increase    
    ${price}=    Get Text    ${cart_total_price}
    ${price_int}=    Replace String Using Regexp    ${price}    \\D    ${EMPTY}
    ${warranty_price}=    Get Text     ${xpath_warranty_label}//*[@class='price-vatin']//*[@class='money-part']
    ${warranty_price}=    Replace String Using Regexp    ${warranty_price}    \\D    ${EMPTY}
    Click Element    ${xpath_warranty_label}
    Wait Until Element Does Not Contain    ${cart_total_price}    ${price}    
    ${end_order_price}=    Get Text    ${cart_total_price}
    ${end_order_price}=    Replace String Using Regexp    ${end_order_price}    \\D    ${EMPTY}
    ${price_int}    Evaluate    ${price_int} + ${warranty_price}    
    Should Be Equal As Integers    ${end_order_price}    ${price_int}        
    