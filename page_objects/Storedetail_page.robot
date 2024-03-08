*** Setting ***
Documentation    All Tests for Store Detail Page Tenere V2
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
# Testcase 01
Check Title and Meta Desc and Canonical
    Get Date Time
    ${title}=    Get Title
    ${best_discount}=    Get Text    ${BestDiscount_Stats}
    ${availble_coupon}=    Get Text    ${CouponAvailable_Stats}
    Should Be Equal As Strings    ${title}      ${best_discount} OFF ${STORE_NAME} Coupon Codes - ${month} ${year} Promo Codes
    ${meta_desc}=    Get Element Attribute    xpath=//meta[@name="description"]    content
    Should Be Equal As Strings    ${meta_desc}    These ${availble_coupon} Available ${STORE_NAME} discount codes last updated TODAY can help you save Upto ${best_discount} OFF. Buy cheaper with ${STORE_NAME} coupons & promo codes NOW!
    ${canonical}=    Get Element Attribute    xpath=//link[@rel="canonical"]    href
    Should Be Equal As Strings    ${canonical}    https://${STORE_NAME_ALIAS}.${LINK}/coupons/

# Testcase 02
Check button Shop now
    Check Link Go    ${ShopNowBtn_Store}    nofollow

Recommended Stores visible and has more than 5 items
    Check tab Stores visible and has more than 5 items    ${RecommendedTitle_Store}    xpath://aside/div[4]/div/div

Best Stores visible and has more than 5 items
    Check tab Stores visible and has more than 5 items    ${BestTitle_Store}    xpath://aside/div[5]/div/div

Competitor box visible and has more than 5 items
    Check tab Stores visible and has more than 5 items    ${CompetitorTitle_Store}    xpath://div[@class='box box-competitor-coupon']/div[2]/div

# Testcase 03
H1 title visible and has info of coupon stats
    Get Date Time
    Element Should Be Visible    ${Title_H1_Store}
    ${title_h1}=    Get Text    ${Title_H1_Store}
    ${best_discount}=    Get Text    ${BestDiscount_Stats}
    ${availble_cp}=    Get Text    ${CouponAvailable_Stats}
    Should Be Equal As Strings    ${title_h1}    ${STORE_NAME} Coupons & Promo Codes with ${best_discount} off (${availble_cp} Working Codes) ${month} ${year}

Check link of "Add rating" button
    ${link_add_rating_btn}=    Get Element Attribute    ${AddRating_Store}    href
    Should Be Equal As Strings    ${link_add_rating_btn}    ${REVIEW_URL}/

# Testcase 04
Check filter coupon, all "Get Deal" is invisible
    Click Filter    ${Filter_Coupon_Store}
    Element Should Not Be Visible    xpath://div[@class='coupon']//button[@innertext='Get Deal']
    
Check filter deal, all "Get Code" is invisible
    Click Filter    ${Filter_Deal_Store}
    Element Should Not Be Visible    xpath://div[@class='coupon']//button[@innertext='Get Code']

Check Filter All Offers, all coupons is visible
    Click Filter    ${Fitler_All_Store}
    Element Should Be Visible    css:.btn.get-btn.get-deal.go.order-sm-3
    Element Should Be Visible    css:.btn.get-btn.get-code.go.order-sm-3

Check Sort Verified
    Click Sort    ${Sort_Verified_Store}
    Element Should Be Visible    css:div#verified-Coupons-of-${STORE_NAME}
    ${tag_title}=    Get Text    xpath://div[@class='box-coupon'][1]/h2
    Should Be Equal As Strings    ${tag_title}      VERIFIED COUPONS OF ${STORE_NAME_UPPER}

Check Sort Latest
    Click Sort    ${Sort_Latest_Store}
    Element Should Be Visible    css:div#latest-Coupons-of-${STORE_NAME}
    ${tag_title}=    Get Text    xpath://div[@class='box-coupon'][1]/h2
    Should Be Equal As Strings    ${tag_title}      LATEST COUPONS OF ${STORE_NAME_UPPER}

Check Sort Best
    Click Sort    ${Sort_Best_Store}
    Element Should Be Visible    css:div#${STORE_NAME_ALIAS}-best-coupons
    ${tag_title}=    Get Text    xpath://div[@class='box-coupon'][1]/h2
    Should Be Equal As Strings    ${tag_title}      BEST ${STORE_NAME_UPPER} COUPONS

Check Jumpto Today's Top, page will scroll to "box box-today-top" class
    ${before_scroll}=    Execute JavaScript    return [window.scrollX, window.scrollY]
    Click JumpTo    xpath:/html//div[@id='jsFilter']//a[@href='#${STORE_NAME_ALIAS}-today-top']
    ${after_scroll}=    Execute JavaScript    return [window.scrollX, window.scrollY]
    Should Not Be Equal    ${before_scroll}    ${after_scroll}
    Page Should Contain Element    css:.box-today-top

# Testcase 05
Get info of title box coupon
    ${title_cp}=    Get Text    ${Title_FirstCP_Store}
    ${title_cp}=    Convert To Lower Case    ${title_cp}   
    Set Global Variable    ${title_cp}

Assert title and link
    Sleep    3
    ${title_popup}=    Get Text    ${Title_Popup}
    ${title_popup}=    Convert To Lower Case    ${title_popup}
    Should Be Equal As Strings    ${title_cp}    ${title_popup}
    Check Link Go    ${Storename_Popup}    noopener
    ${link_FAQ}=    Get Element Attribute        css:.help > a    href
    Should Be Equal As Strings    ${link_FAQ}    ${DOMAIN3}/faq-page
    ${link_login}=    Get Element Attribute    css:.already-have > a    href
    Should Be Equal As Strings    ${link_login}    ${DOMAIN3}/login

Action Copy code
    [Arguments]    ${location}
    ${after_click}=    Get Text    ${location}
    Should Be Equal As Strings    ${after_click}    Copied
    ${after_click_color}=    Get Element Attribute    ${location}    style
    Should Contain   ${after_click_color}    background: rgb(72, 72, 72); opacity: 0.65;

Check all value coupon is visible
    Sleep    3
    Element Should Be Visible    xpath://div[@class='coupon']/div[1]/div[1]/span

Check info of Popup Get Deal
    Check Link Go    ${Btn_ContinueToStore_Popup}    noopener
    Element Should Be Visible    css:.desc
