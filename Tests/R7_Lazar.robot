*** Variables ***
${product_id}    ${unavailable_product_id}
${unavailable_item}    xpath=//*[contains(@id, 'popup-basket-with-unavailable-item')]
${btn_agree_unavailable}    xpath=//*[contains(@class, 'btn agree')]    
${no_delivery_date}    xpath=//*[@class='op-sum-del-pay']//*[@class="content"]//strong
${btn_back}    xpath=//*[@class='op-back']
${product_line}    xpath=//*[contains(@data-ga-product, '"id":"${product_id}"')]
${quantity_input}    ${product_line}//*[@name='quantity']
${home_servis_selection}     xpath=//a[@href='/domaci-servis/224897/produkt']/ancestor::label
${home_servis_selected}    xpath=//*[text()='224897']
${expres_delivery}    xpath=//label[@for='frm-transport-6']
${pay_by_card}    xpath=//label[@for='frm-payUPaymentCode-0']
${expres_delivery_selected}    xpath=//div[@class='op-sum-flex']//span[contains(text(),'EXPRES')]
${pay_by_card_selected}    xpath=//div[@class='op-sum-flex']//span[contains(text(),'Online')]

${i_mail}    xx@xx.com
${i_phone}    555555555
${i_name}    xxz
${i_sname}    xxy
${i_street}    Ulice 1234/5b
${i_city}    xxa
${i_postal}    100 00

*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Product    ${product_id}    ${browser} 
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
T1.7.1 - Order Steps Back Retain Selections
    Wait Until Page Contains Element    ${btn_continue_order}
    Input Text    ${quantity_input}    1
    Click Element    ${product_line}//*[@class='up']
    Wait Until Page Contains Element    ${product_line}//*[@name='quantity' and @value='2']
    Click Element    ${btn_continue_order}
    Wait Until Page Contains Element     ${unavailable_item}
    Click Element    ${btn_agree_unavailable}
    
    Wait Until Page Contains Element     ${btn_continue_order}
    Click Element    ${btn_back}
    
    Wait Until Page Contains Element    ${btn_continue_order}
    Page Should Contain Element    ${product_line}//*[@name='quantity' and @value='2']
    Click Element    ${btn_continue_order}
    Wait Until Page Contains Element     ${unavailable_item}
    Click Element    ${btn_agree_unavailable}
    
    Wait Until Page Contains Element    ${btn_continue_order}
    Click Element    ${home_servis_selection}
    Click Element    ${btn_continue_order}

    Wait Until Page Contains Element    ${btn_continue_order}
    Click Element    ${expres_delivery}
    Click Element    ${pay_by_card}
    Click Element    ${btn_back}
    
    Wait Until Page Contains Element    ${btn_continue_order}
    Page Should Contain Element    ${home_servis_selected}
    Click Element    ${btn_continue_order}
    Wait Until Page Contains Element     ${unavailable_item}
    Click Element    ${btn_agree_unavailable}
    
    Wait Until Page Contains Element    ${btn_continue_order}
    Click Element    ${btn_continue_order}
    
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