*** Settings ***
Resource    ../Imports/Order_Imports.txt
Test Setup  Open Cart Page With Payment    ${reference_product_id}    ${browser}
Test Teardown    Capture Screenshot And Close Browser

*** Variables ***
${product_id}    ${reference_product_id}
${other_payment}  xpath=//a[@class='op-show-pay-types next-items ico-left ico-arrow-down']
${cbs_payment}    xpath=//*[@class='op-title icon-pt-payu-cbc']
${ba_payment}     xpath=//*[@class='op-title icon-pt-7']

*** Test Cases ***
T2.7.1 - Choose card payment
  Wait Until Page Contains Element    ${cbs_payment}
  Click Element    ${cbs_payment}
  Wait Until Page Contains    Online bankovnictví ČSOB

T2.7.2 - Choose bank account payment
  Wait Until Page Contains Element    ${ba_payment}
  Click Element    ${ba_payment}
  Wait Until Page Contains    Zálohou - převodem z účtu
