*** Settings ***
Documentation    Testcase Review API
Resource    ../Resource/Review_API.robot
Suite Setup    Connect To Review API

*** Test Cases ***
GET API of review Info
    Request Review Info
    Check The Status Code    200
    Check The Reason    OK
    Check Info Of List Review

Get API of User Rate
    Request User Rate
    Check The Status Code    200
    Check The Reason    OK
    Check info of User rate

GET API of Lastest Coupon
    Request Lastest Coupon
    Check The Status Code    200
    Check The Reason    OK

GET API of Subpage for Store
    Request Subpage For Store
    Check The Status Code    200
    Check The Reason    OK

GET API of List Review
    Request List Review
    Check The Status Code    200
    Check The Reason    OK

GET API of QA List
    Request QA List
    Check The Status Code    200
    Check The Reason    OK

GET API of Store info sidebar
    Request Store Info Sidebar
    Check The Status Code    200
    Check The Reason    OK
    Check Info Store Of Sidebar

GET API of Trending competitor store
    Request Trending Competitor Store
    Check The Status Code    200
    Check The Reason    OK
