*** Setting ***
Documentation    All APIs for Review Page
Library            RequestsLibrary
Library            Collections
Library            JSONLibrary
Variables          ../../testdata/test_data.py

*** Variable ***
${base_url}    ${DOMAIN}/api/
${AUTH}        Basic Auth
# Headers
${CONTENT_TYPE}    application/json


*** Keywords ***
# Setup Teardown
Connect to Review API
    Create Session    reviewAPI     ${base_url}    verify=true
    ${HEADERS}    Create Dictionary    content-type=${CONTENT_TYPE}
    Set Suite Variable    ${HEADERS}
    
Request Review info
    ${respone}=    GET On Session    reviewAPI     review-info/${STORE_NAME_ALIAS}    # endpoint
    Log    ${respone.text}    #respone body
    Set Test Variable    ${respone}

Request User Rate
    ${respone}=    GET On Session        reviewAPI     user-rate/${STORE_NAME_ALIAS}
    Log    ${respone.text}
    Set Test Variable    ${respone}

Request Lastest Coupon
    ${respone}=    GET On Session        reviewAPI     latest-coupon/${STORE_NAME_ALIAS}
    Log    ${respone.text}
    Set Test Variable    ${respone}

Request Subpage for Store
    ${respone}=    GET On Session        reviewAPI     subpage-for-store/${STORE_NAME_ALIAS}
    Log    ${respone.text}
    Set Test Variable    ${respone}

Request List Review
    ${respone}=    GET On Session        reviewAPI     review-list/${STORE_NAME_ALIAS}
    Log    ${respone.text}
    Set Test Variable    ${respone}

Request QA List
    ${respone}=    GET On Session        reviewAPI     faq-list/${STORE_NAME_ALIAS}
    Log    ${respone.text}
    Set Test Variable    ${respone}
     
Request Store Info Sidebar
    ${respone}=    GET On Session        reviewAPI     get-data-coupons/${STORE_NAME_ALIAS}
    Log    ${respone.text}
    Set Test Variable    ${respone}

Request trending competitor store
    ${respone}=    GET On Session        reviewAPI     trend-competitor-store/${STORE_NAME_ALIAS}
    Log    ${respone.text}
    Set Test Variable    ${respone}
    
# -------- Validations -------- #
Check the status code
    [Arguments]    ${expected_status}
    Should Be Equal As Strings    ${respone.status_code}    ${expected_status}

Check the reason
    [Arguments]    ${reason_expected}
    Should Be Equal As Strings    ${respone.reason}    ${reason_expected}

Check info of List review
    Dictionary Should Contain Item    ${respone.json()}[data]    alias    ${STORE_NAME_ALIAS}
    Dictionary Should Contain Item    ${respone.json()}[data]    name     ${STORE_NAME}
    Should Not Be Empty    ${respone.json()}[data]    logo
    Should Not Be Empty    ${respone.json()}[data]    rated_user_count
    Should Not Be Empty    ${respone.json()}[data]    rated_star

Check info of User rate
    Should Not Be Empty    ${respone.json()}[data][dataWithType]    Overall
    Should Not Be Empty    ${respone.json()}[data]    reviewCount

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