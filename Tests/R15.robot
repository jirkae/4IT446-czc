*** Variables ***
${product_id}    ${reference_product_id}

*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Product    ${product_id}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
T2.4.1 - Billing Address Form
    Go To   ${url_delivery_payments}
    Wait Until Page Contains Element    ${input_submit}     
    Click Element    ${input_submit}
    Go To    ${url_cart_addresses}
    Wait Until Page Contains Element    ${delivery_informations_form}
    Click Element    ${input_submit}
    Page Should Contain Element    xpath=//input[contains(@class,'input-error')]    "Should be 7 error messages"    7
    Input Text    ${input_email}    ${default_text}
    Input Text    ${input_phoneNumberFormatted}    ${default_text}
    Input Text    ${input_name}    ${default_text}
    Input Text    ${input_surname}    ${default_text}
    Input Text    ${input_street}    ${default_text}
    Input Text    ${input_city}    ${default_text}
    Input Text    ${input_zipCodeFormatted}    ${default_text}
    Click Element    ${input_submit}
    Page Should Contain Element    xpath=//*[@for="frm-registration.email" and contains(@class, 'input-error')]
    Page Should Contain Element    xpath=//*[@for="frm-registration.phoneNumberFormatted" and contains(@class, 'input-error')]
    Page Should Contain Element    xpath=//*[@for="frm-registration.street" and contains(@class, 'input-error')]
    Page Should Contain Element    xpath=//*[@for="frm-registration.zipCodeFormatted" and contains(@class, 'input-error')]    
    Page Should Contain Element    xpath=//input[contains(@class,'input-error')]    "Should be 4 error messages"    4
    Input Text    ${input_email}    ${valid_email}
    Input Text    ${input_phoneNumberFormatted}    ${valid_phoneNumberFormatted}
    Input Text    ${input_street}    ${valid_street}
    Input Text    ${input_zipCodeFormatted}    ${valid_zipCodeFormatted}
    Click Element    ${input_submit}
    Wait Until Page Contains    Shrnutí před odesláním    