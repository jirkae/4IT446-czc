*** Variables ***
${product_id}    ${unavailable_product_id}
${product_line}    xpath=//*[contains(@data-ga-product, '"id":"${product_id}"')]
${quantity_input}    ${product_line}//*[@name='quantity']

*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Product    ${product_id}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
T1.7.1 - Order Step-Backs Retain Selections
    Wait Until Page Contains Element    ${btn_continue_order}
    Input Text    ${quantity_input}    1
    Click Element    ${product_line}//*[@class='up']
    Wait Until Page Contains Element    ${product_line}//*[@name='quantity' and @value='2']
    Click Element    ${btn_continue_order}
    Wait Until Page Contains Element     ${unavailable_item}
    Click Element    ${btn_agree_unavailable}
    
    Step Back
    Wait Until Page Contains Element    ${btn_continue_order}
    Page Should Contain Element    ${product_line}//*[@name='quantity' and @value='2']
    Step Forward Unavailable Item
    
    Wait Until Page Contains Element    ${btn_continue_order}
    Click Element    ${home_servis_selection}
    Click Element    ${btn_continue_order}

    Wait Until Page Contains Element    ${btn_continue_order}
    Click Element    ${expres_delivery}
    Click Element    ${pay_by_card}
    Click Element    ${btn_back}
    
    Wait Until Page Contains Element    ${btn_continue_order}
    Page Should Contain Element    ${home_servis_selected}
    Step Forward Unavailable Item
    Step Forward
    
    Wait Until Page Contains Element    ${btn_continue_order}
    Page Should Contain Element    ${expres_delivery_selected}
    Page Should Contain Element    ${pay_by_card_selected}
    Click Element    ${btn_continue_order}
    
    Wait Until Page Contains Element    ${btn_continue_order}    
    Input Text    id=frm-registration.email    ${i_mail}
    Input Text    id=frm-registration.phoneNumberFormatted    ${i_phone}
    Input Text    id=frm-registration.name    ${i_name}
    Input Text    id=frm-registration.surname    ${i_sname}
    Input Text    id=frm-registration.street    ${i_street}
    Input Text    id=frm-registration.city    ${i_city}
    Input Text    id=frm-registration.zipCodeFormatted    ${i_postal}
    Click Element    ${btn_continue_order}
    
    Wait Until Page Contains Element    ${no_delivery_date}
    Click Element    ${btn_back}
    
    Wait Until Page Contains Element    ${btn_continue_order}
    Page Should Contain Element   //input[@value='${i_mail}']
    Page Should Contain Element   //input[@value='${i_phone}']
    Page Should Contain Element   //input[@value='${i_name}']
    Page Should Contain Element   //input[@value='${i_sname}']
    Page Should Contain Element   //input[@value='${i_street}']
    Page Should Contain Element   //input[@value='${i_city}']
    Page Should Contain Element   //input[@value='${i_postal}']