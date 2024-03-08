*** Setting ***
Documentation    A resource file with reusable keywords ana variables
...
...             The system specific keywords created here form our own
...             domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary.
Library         SeleniumLibrary
Library         Collections
Library         DateTime
Library         page_objects/LambdaTestStatus.py
Variables        ../testdata/locators.py
Variables        ../testdata/test_data.py
Resource         ../API/Resource/Storedetail_API.robot

*** Variable ***
${month}
${year}

*** Keywords ***
Wait Until Element passed is located on Page
	[Arguments]    ${page_locator}
	Wait Until Element Is Visible    ${page_locator}

Wait Until Element is invisible on Page
	[Arguments]    ${page_locator_2}
	Wait Until Element Is Invisible On Page    ${page_locator_2}

Wait Until Element is clickable on Page
	[Arguments]    ${page_locator_3}
	Wait Until Element Is Clickable On Page    ${page_locator_3}

Get Date Time
	${date}=    Get Current Date   result_format=datetime
    ${month}=    Convert Date    ${date}    result_format=%B
    ${year}=    Convert Date    ${date}     result_format=%Y

    Set Global Variable    ${month}
    Set Global Variable    ${year}

Check info Store Review
    ${link_store}=    Get Element Attribute    ${StoreReviewBtn_Review}    href
    ${text_store}=    Get Text    ${StoreReviewBtn_Review}
    Should Be Equal As Strings    ${link_store}        https://${STORE_NAME_ALIAS}.${LINK}/
    Should Be Equal As Strings    ${text_store}    ${STORE_NAME} Reviews

Check info go to Store Detail
    ${link_store}=    Get Element Attribute    ${StoreCouponBtn_Review}    href
    ${text_store}=    Get Text    ${StoreCouponBtn_Review}
    Should Be Equal As Strings    ${link_store}        https://${STORE_NAME_ALIAS}.${LINK}/coupons
    Should Be Equal As Strings    ${text_store}    ${STORE_NAME} Coupons

Check info Homepage
    [Arguments]    ${locator}
    ${link_store}=    Get Element Attribute    ${locator}    href
    ${text_store}=    Get Text    ${locator}
    Should Be Equal As Strings    ${link_store}        ${DOMAIN3}/
    Should Be Equal As Strings    ${text_store}    Tenere Homepage

Check tab Stores visible and has more than 5 items
    [Arguments]    ${title_tab}    ${locator}
    Element Should Be Visible    ${title_tab}
    ${count_recommended}=    Get Element Count    ${locator}
    Should Be True    ${count_recommended}>5
    
Click Filter
    [Arguments]    ${filter_item}
    Click Element    ${Filter_Store}
    Click Element    ${filter_item}
    
Click Sort
    [Arguments]    ${sort_item}
    Click Element    ${Sort_Store}
    Click Element    ${sort_item}
    
Click JumpTo
    [Arguments]    ${jumpto_item}
    Click Element    ${JumpTo_Store}
    Click Element    ${jumpto_item}


Check Link Go
    [Arguments]    ${location}    ${type}
    Connect To Store API    
    Request Store Info    
    Get Info of store
    ${link_go}=    Get Element Attribute    ${location}    href
    ${rel_go}=    Get Element Attribute    ${location}    rel 
    ${target_go}    Get Element Attribute    ${location}    target 
    Should Contain    ${type}    ${rel_go}
    Should Be Equal As Strings    ${target_go}      _blank
    Should Be Equal As Strings    ${link_go}    ${link_go}
    
    
