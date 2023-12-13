*** Setting ***
Documentation    All APIs for Sub Page
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
Connect to Subpage API
    Create Session    subpageAPI     ${base_url}    verify=true
    ${HEADERS}    Create Dictionary    content-type=${CONTENT_TYPE}
    Set Suite Variable    ${HEADERS}

Request Subpage Info
    ${respone}=    GET On Session    subpageAPI     sub-page/${STORE_SUBPAGE}/${SUB_PAGE_ALIAS}
    Log    ${respone.text}    #respone body
    Set Test Variable    ${respone}

Request Subpage Content
    ${respone}=    GET On Session        subpageAPI     sub-page/${STORE_SUBPAGE}/${SUB_PAGE_ALIAS}/content-subpage-store
    Log    ${respone.text}
    Set Test Variable    ${respone}

# -------- Validations -------- #
Check the status code
    [Arguments]    ${expected_status}
    Should Be Equal As Strings    ${respone.status_code}    ${expected_status}

Check the reason
    [Arguments]    ${reason_expected}
    Should Be Equal As Strings    ${respone.reason}    ${reason_expected}

Check info of Subpage Info
    Dictionary Should Contain Item    ${respone.json()}[data][storeDetail]    alias    ${STORE_SUBPAGE}    
    Should Not Be Empty    ${respone.json()}[data][storeDetail]    description
    Should Not Be Empty    ${respone.json()}[data][storeDetail]    head_description
    Should Not Be Empty    ${respone.json()}[data][storeDetail]    contentSubpageStore
    Should Not Be Empty    ${respone.json()}[data][storeDetail]    exclusiveCoupon
    Should Not Be Empty    ${respone.json()}[data][storeDetail]    couponStore

Check info of content Subpage
    Dictionary Should Contain Item    ${respone.json()}[data][0]    alias     ${SUB_PAGE_ALIAS}
    Should Not Be Empty    ${respone.json()}[data][0]    title
    Should Not Be Empty    ${respone.json()}[data][0]    content
    Should Not Be Empty    ${respone.json()}[data][0]   meta_title
    Should Not Be Empty    ${respone.json()}[data][0]    meta_desc