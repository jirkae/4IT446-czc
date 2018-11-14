*** Variables ***
${product_id}    ${reference_product_id}

*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Product    ${product_id}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
T1.8.1 - Invalid Code
    Page Should Contain Element    ${discount_cupons}
    Enter Code    ${invalid_code}
    Wait Until Page Contains Element    ${discount_cupons_error}
    
T1.8.2 - Valid Code
    Enter Code    ${valid_code}
    Wait Until Page Contains    ${valid_code_name}
    
*** Keywords ***
Enter Code
    [Arguments]    ${code}
    Input Text    ${discount_cupons}    ${code}
    Click Element    ${discount_cupons_send}