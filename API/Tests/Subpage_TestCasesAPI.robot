*** Setting ***
Documentation    Testcase Subpage API
Resource    ../Resource/Subpage_API.robot
Suite Setup    Connect To Subpage API

*** Test Cases ***
GET API for Subpage Info
    Request Subpage Info    
    Check The Status Code    200
    Check The Reason    OK
    Check Info Of Subpage Info

GET API for content Subpage
    Request Subpage Content
    Check The Status Code    200
    Check The Reason    OK
    Check Info Of Content Subpage