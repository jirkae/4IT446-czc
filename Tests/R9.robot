*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Payment    ${reference_product_id}    ${browser}
Test Teardown    Capture Screenshot And Close Browser

*** Variables ***
${product_id}    ${reference_product_id}
${ppl_delivery}    xpath=//*[@class='op-title icon-tt-99']
${zip_code}   xpath=//*[@name='zip-code']
${btn_confirm_ppl}    xpath=//*[@class='btn right']

*** Test Cases ***
T2.1.1 - Choose ppl standart delivery
  Wait Until Page Contains Element    ${ppl_delivery}
  Click Element    ${ppl_delivery}
  Input Text    ${zip_code}   19900
  Wait Until Page Contains Element    ${ppl_delivery}
  Click Element   ${btn_confirm_ppl}
  Wait Until Page Contains    PPL s avizací po ČR
