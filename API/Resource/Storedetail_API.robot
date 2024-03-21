*** Settings ***
Documentation    All APIs for Store Detail Page
Library            RequestsLibrary
Library            Collections
Library            JSONLibrary
Library            String
Variables          ../../testdata/test_data.py

*** Variables ***
${base_url}    ${DOMAIN_API}/api/
${AUTH}        Basic Auth
# Headers
${CONTENT_TYPE}    application/json
${params}        alias:ann-taylor


*** Keywords ***
# Setup Teardown
Connect to Store API
    Create Session    storeAPI     ${base_url}    verify=true
    ${HEADERS}    Create Dictionary    content-type=${CONTENT_TYPE}
    Set Suite Variable    ${HEADERS}
    
Request Store info
    ${respone}=    GET On Session    storeAPI     store/${STORE_NAME_ALIAS}    # endpoint
    Log    ${respone.text}    #respone body
    Set Test Variable    ${respone}

Request Recommended Store
    ${respone}=    GET On Session        storeAPI     recommended-stores
    Log    ${respone.text}
    Set Test Variable    ${respone}

Request Best Store
    ${respone}=    GET On Session        storeAPI     best-stores    params=${params}
    Log    ${respone.text}
    Set Test Variable    ${respone}

Request Competitor Store
    ${respone}=    GET On Session        storeAPI     get-stores-same-categories/${STORE_NAME_ALIAS}
    Log    ${respone.text}
    Set Test Variable    ${respone}

Request Best Coupon
    ${respone}=    GET On Session        storeAPI     get-best-coupons/${STORE_NAME_ALIAS}
    Log    ${respone.text}
    Set Test Variable    ${respone}
     
Request Other Coupons
    ${respone}=    GET On Session        storeAPI     get-other-coupons/${STORE_NAME_ALIAS}
    Log    ${respone.text}
    Set Test Variable    ${respone}

Request Today Top Codes, Saving Tips and Expired Coupons
    ${respone}=    GET On Session        storeAPI     get-data-end-page/${STORE_NAME_ALIAS}
    Log    ${respone.text}
    Set Test Variable    ${respone}

Request Store Sidebar Info
    ${respone}=    GET On Session    storeAPI     get-data-coupons/${STORE_NAME_ALIAS}
    Log    ${respone.text}    #respone body
    Set Test Variable    ${respone}
    
# -------- Validations -------- #
Check the status code
    [Arguments]    ${expected_status}
    Should Be Equal As Strings    ${respone.status_code}    ${expected_status}

Check the reason
    [Arguments]    ${reason_expected}
    Should Be Equal As Strings    ${respone.reason}    ${reason_expected}

Check info of Store
    Dictionary Should Contain Item    ${respone.json()}[data]    alias    ${STORE_NAME_ALIAS}
    Dictionary Should Contain Item    ${respone.json()}[data]    name     ${STORE_NAME}
    Should Not Be Empty    ${respone.json()}[data]    logo
    Should Not Be Empty    ${respone.json()}[data]    description
    Should Not Be Empty    ${respone.json()}[data]    store_url 
    Should Not Be Empty    ${respone.json()}[data]    affiliate_url
    Should Not Be Empty    ${respone.json()}[data]    rated_user_count
    Should Not Be Empty    ${respone.json()}[data]    rated_star
    Should Not Be Empty    ${respone.json()}[data]    coupons_count
    Should Not Be Empty    ${respone.json()}[data]    about
    Should Not Be Empty    ${respone.json()}[data]    aboutOurStore
    Should Not Be Empty    ${respone.json()}[data][guides]    title
    Should Not Be Empty    ${respone.json()}[data][guides]    description
    Should Not Be Empty    ${respone.json()}[data]    similar_store
    Should Not Be Empty    ${respone.json()}[data]    h1_title
    Should Not Be Empty    ${respone.json()}[data]    faqs
    Should Not Be Empty    ${respone.json()}[data]    categories

Check info store of Sidebar
    Dictionary Should Contain Item    ${respone.json()}[data]    alias    ${STORE_NAME_ALIAS}
    Dictionary Should Contain Item    ${respone.json()}[data]    name     ${STORE_NAME}
    Should Not Be Empty    ${respone.json()}[data]    verifiedCouponCode
    Should Not Be Empty    ${respone.json()}[data]    averageSaving
    Should Not Be Empty    ${respone.json()}[data]    bestDiscountToday
    Should Not Be Empty    ${respone.json()}[data]    numberOfAvailableCoupon
    Should Not Be Empty    ${respone.json()}[data]    hasFreeShipping
    Should Not Be Empty    ${respone.json()}[data]    lastUpdatedCoupon
    Should Not Be Empty    ${respone.json()}[data]    rated_user_count
    Should Not Be Empty    ${respone.json()}[data]    rated_star

Check info data of Today Top Codes, Saving tips and expired coupons
    Should Not Be Empty    ${respone.json()}[data]    topCoupons 
    Should Not Be Empty    ${respone.json()}[data]    savingTips

Get Info of store
    ${short_url}=    Get Value From Json    ${respone.json()}[data]   short_store_url
    ${short_url}=    Convert Json To String    ${short_url}
    ${short_url}=    Remove String        ${short_url}    ["    "]
    Set Test Variable        ${short_url}
    
    ${count_coupon}=    Get Value From Json    ${respone.json()}[data]    coupons_count
    ${count_coupon}=    Convert Json To String    ${count_coupon}
    ${count_coupon}=    Remove String    ${count_coupon}    [    ]
    Set Test Variable    ${count_coupon}
    
    ${link_go}=    Get Value From Json    ${respone.json()}[data][go]    foreign_key_right
    ${link_go}=    Convert Json To String    ${link_go}
    ${link_go}=    Remove String    ${link_go}    [    ]
    Set Test Variable    ${link_go}