*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Product    ${reference_product_id}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
T2.6.1 - Cart Return to previous step
    Wait Until Page Contains Element    ${btn_continue_order}
    Click Button   ${btn_continue_order} 
    Wait Until Page Contains    Doporučujeme dokoupit
    Click Link      Zpět do košíku
    Location Should Be      ${url_cart} 