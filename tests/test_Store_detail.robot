*** Settings ***
Documentation    Testcases for Review page Tenere V2
...
...
...
Resource        ../page_objects/Storedetail_page.robot
Resource        ../page_objects/Base.robot
Variables       ../testdata/test_data.py
Variables       ../testdata/locators.py
Test Setup      Open Browser    ${url}    headless chrome
Test Teardown    Close All Browsers

*** Variables ***
${url}            ${STORE_DETAIL_URL}

*** Test Cases ***
Test case 01: Check Title, Meta Desc and Canonical
    Check Title and Meta Desc and Canonical

Test case 02: Check link of Sidebar and Related Store - Popular Store, Competitor Store is visible
    Check button Shop now
    Check info Store Review
    Check info Homepage    ${HomeSidebar_Store}
    Recommended Stores visible and has more than 5 items
    Best Stores visible and has more than 5 items
    Competitor box visible and has more than 5 items

Test case 03: Test info of header and content about
    H1 title visible and has info of coupon stats
    Check link of "Add rating" button

Test case 04: Test Filter
    Check filter coupon, all "Get Deal" is invisible
    Check filter deal, all "Get Code" is invisible
    Check Filter All Offers, all coupons is visible
    Check Sort Verified
    Check Sort Latest
    Check Sort Best
    Check Jumpto Today's Top, page will scroll to "box box-today-top" class

Test case 05: Test click Get Code and not open affiliate in second time, all coupons visible
    Get info of title box coupon     ${Title_FirstCP_Store}
    # click getcode button
    Click Button    ${Btn_GetCode_FirstCP}
    Switch Window    NEW
    Assert title and link    ${Storename_Popup_CP}
    Click Button    ${Btn_Copy_Popup}
    Action Copy code    ${Btn_Copy_Popup}
    # click close popup
    Click Element   ${Close_Popup}
    Check all value coupon is visible
    # click copy
    Click Element    ${First_CopyBtn_Store}
    Action Copy code    ${First_CopyBtn_Store}
    Get info of title box coupon    ${Title_FirstCP_Store}
    Click Element          ${Title_FirstCP_Store}
    Assert title and link    ${Storename_Popup_CP}
    Click Element    ${Btn_Copy_Popup}
    Action Copy code    ${Btn_Copy_Popup}

Test case 06: Test click Get Deal
    Get info of title box coupon    ${Title_FirstDeal_Store}
    Click Button    ${Btn_GetDeal_FirstCP}
    Switch Window    NEW
    Assert title and link    ${Storename_Popup_Deal}
    Check info of Popup Get Deal
    # click close popup
    Click Element   ${Close_Popup}
    Check all value coupon is visible
    # click copy
    Click Element    ${First_CopyBtn_Store}
    Action Copy code    ${First_CopyBtn_Store}
    Get info of title box coupon    ${Title_FirstCP_Store}
    Click Element          ${Title_FirstCP_Store}
    Assert title and link    ${Storename_Popup_CP}
    Click Element    ${Btn_Copy_Popup}
    Action Copy code    ${Btn_Copy_Popup}