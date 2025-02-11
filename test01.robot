*** Settings ***
Library             SeleniumLibrary
Suite Setup         Open Browser    https://automationexercise.com/products    Chrome
Suite Teardown      Close Browser

*** Variables ***
${SEARCH_TEXT}      Winter Top

*** Keywords ***
Input Search Product
    [Arguments]    ${SEARCH_TEXT}
    Input Text    //*[@id="search_product"]    ${SEARCH_TEXT}
    Click Button  //*[@id="submit_search"]

Verify Search Result
    Wait Until Element Is Visible    //div[@class="features_items"]    timeout=10s
    Page Should Contain    ${SEARCH_TEXT}
    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    //div[@class="no_results"]    timeout=5s
    Element Should Contain    //div[@class="features_items"]    ${SEARCH_TEXT}

*** Test Cases ***
Search and Verify Product
    Input Search Product    ${SEARCH_TEXT}
    Verify Search Result

