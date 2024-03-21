*** Settings ***
Documentation    Testcase Store API
Resource    ../Resource/Storedetail_API.robot
Suite Setup    Connect To Store API

*** Test Cases ***
GET API of Store Info
    Request Store Info
    Check The Status Code    200
    Check The Reason    OK
    Check Info Of Store

GET API of Recommended Store
    Request Recommended Store
    Check The Status Code    200
    Check The Reason    OK

GET API of Best Store
    Request Best Store
    Check The Status Code    200
    Check The Reason    OK

GET API of Competitor Store
    Request Competitor Store
    Check The Status Code    200
    Check The Reason    OK

GET API of Other Coupons
    Request Other Coupons
    Check The Status Code    200
    Check The Reason    OK

GET API of Today Top Codes, Saving Tips and Expired Coupons
    Request Today Top Codes, Saving Tips And Expired Coupons
    Check The Status Code    200
    Check The Reason    OK
    Check Info Data Of Today Top Codes, Saving Tips And Expired Coupons

GET API of Sidebar Info
    Request Store Sidebar Info
    Check The Status Code    200
    Check The Reason    OK
    Check Info Store Of Sidebar