*** Settings ***
Documentation    All Tests for Review Page Tenere V2
...
...
...
Library          SeleniumLibrary
Library          String
Library          Collections
Library          DateTime
Variables        ../testdata/locators.py
Variables        ../testdata/test_data.py
Resource         ../API/Resource/Storedetail_API.robot
Resource         Base.robot

*** Variables ***
${title_cp}

*** Keywords ***

Remove Trailing Non-Numeric
    [Arguments]    ${string}
    ${new_string}=    Replace String Using Regexp    ${string}    \\D*$    ${EMPTY}
    RETURN    ${new_string}

Sort Dates
    [Arguments]    ${date_objects}
    ${sorted_objects}=    Sort List    ${date_objects}
    ${sorted_dates}=    Create List
    FOR    ${date_obj}    IN    @{sorted_objects}
        ${date_str}=    Format Date    ${date_obj}    result_format=%B %d, %Y
        Append To List    ${sorted_dates}    ${date_str}
    END
    RETURN    ${sorted_dates}

# Testcase 01
Check Title and Meta Desc and Canonical
    Connect to Store API
    Request Store info
    Get Info of store
    Get Date Time
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}      ${STORE_NAME} Reviews - Read Customer Reviews of ${short_url}
    ${meta_desc}=    Get Element Attribute    xpath=//meta[@name="description"]    content
    Should Be Equal As Strings    ${meta_desc}    Save big with ${STORE_NAME} in ${month} ${year}, via ${count_coupon} verified and active coupons available. Exclusive savings only at ${SITE_NAME}.
    ${canonical}=    Get Element Attribute    xpath=//link[@rel="canonical"]    href
    Should Be Equal As Strings    ${canonical}    https://${STORE_NAME_ALIAS}.${LINK}/

# Testcase 02
Check link Button Write a Review
    ${link_writeareview}=    Get Element Attribute        ${WriteAReview_Review}    href
    Should Be Equal As Strings    ${link_writeareview}    ${REVIEW_URL}/#
    

Check Related Store visible
    Element Should Be Visible    css:aside > div:nth-of-type(3)
    ${item_related}=    Get Element Count    css:aside > div:nth-of-type(3) > div > div
    Should Be True    ${item_related} >= 5

Check Popular Store visible
    Element Should Be Visible    css:aside > div:nth-of-type(4)
    ${item_popular}=    Get Element Count    css:aside > div:nth-of-type(4) > div > div
    Should Be True    ${item_popular} >= 5

# Testcase 03
Check about and pros - cons is visible
    Element Should Be Visible        ${Desc_Review}
    Element Should Be Visible    ${Pros_Cons_Review}

Check rating and rated user is same with sidebar
    ${rating_sidebar}=    Get Text    ${Rating_Sidebar_Review}
    ${rating}=    Get Text    ${Rating_Review}
    ${rating}=    Remove String    ${rating}    (    )
    ${rating_count}=    Get Text    ${Rating_Count_Review}
    ${rating_count}=    Remove Trailing Non-Numeric    ${rating_count}
    Should Contain    Rated ${rating} by ${rating_count} users        ${rating_sidebar}

Check Title H1
    ${title_h1}=    Get Text    ${Title_H1_Review}
    Should Be Equal As Strings    ${title_h1}    ${STORE_NAME} Reviews
    
Link "Get Coupons" Btn
    ${get_coupon_btn}=    Get Element Attribute    ${GetCoupon_Review}    href
    Should Be Equal As Strings    ${get_coupon_btn}    https://${STORE_NAME_ALIAS}.${LINK}/coupons
    
Link "Go to website" Btn
    ${goto_website_btn}=    Get Element Attribute    ${GoTo_Review}    href
    Should Start With    ${goto_website_btn}    https://${STORE_NAME_ALIAS}.${LINK}/go/

# Testcase 04
Assert Score with rating header
    ${score}=    Get Text    ${Overall_Rating_Review}
    ${rating}=    Get Text    ${Rating_Review}
    ${rating}=    Remove String    ${rating}    (    ${SPACE}/ 5)
    Should Be Equal As Strings    ${score}    ${rating}

Check Coupon Box, Review box, QA Box and Similar Store is visible
    Element Should Be Visible    ${Coupon_Box_Review}
    Element Should Be Visible    ${Review_Box_Review}
    Element Should Be Visible    ${QA_Box_Review}
    Element Should Be Visible    ${Similar_Box_Review}
    ${count_similar_store}=    Get Element Count    css:.store-grid > div
    Should Be Equal As Integers    ${count_similar_store}    8

Check link of title, button "add rating" of similar store
    ${similar_store_name}=    Get Text    ${Title_SimilarFirst_Review}
    ${similar_store_name}=    Convert To Lower Case    ${similar_store_name}
    ${similar_store_name}=    Replace String    ${similar_store_name}    ${SPACE}    -
    ${similar_link}=    Get Element Attribute    ${Title_SimilarFirst_Review}    href
    Should Be Equal As Strings    ${similar_link}    https://${similar_store_name}.${LINK}/
    ${add_rating_link}=    Get Element Attribute    ${AddRating_SimilarFirst_Review}    href
    Should Be Equal As Strings       ${add_rating_link}    https://${similar_store_name}.${LINK}/
    
# Testcase 05
Get title of coupon
    ${title_cp}=    Get Text    ${TitleCpnFirst_Review}
    Set Global Variable    ${title_cp}
    
Click First Coupon
    Click Button    ${GetCodeFirst_Review}

Check info of popup Get code/Get deal
    Wait Until Element Is Visible    ${Title_Popup}
    ${title_pu}=    Get Text    ${Title_Popup}
    Should Be Equal As Strings    ${title_pu}    ${title_cp}

# Testcase 06
Click Filter 
    [Arguments]    ${filter}
    Click Element    ${SortByFilter_Review}
    Click Element    ${filter}

Check date of review items sort from oldest to newest
    #div:nth-of-type(12) > .review__date
    ${dates}=    Create List    
    FOR    ${i}    IN RANGE    4    12
        ${a}=    Get Text    css:div:nth-of-type(${i}) > .review__date
        Append To List    ${dates}    ${a}
    END
    Log    ${dates}

    ${date}=    Copy List    ${dates}
    Sort List   ${date}

    Lists Should Be Equal    ${date}    ${dates}

Check date of review items sort from newest to oldest
    #div:nth-of-type(12) > .review__date
    ${dates2}=    Create List
    FOR    ${i}    IN RANGE    4    12
        ${a}=    Get Text    css:div:nth-of-type(${i}) > .review__date
        Append To List    ${dates2}    ${a}
    END
    Log    ${dates2}

    ${date2}=    Copy List    ${dates2}
    Sort List           ${date2}

    Lists Should Be Equal    ${date2}    ${dates2}
