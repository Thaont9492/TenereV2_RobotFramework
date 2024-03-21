*** Settings ***
Documentation    Testcases for Review page Tenere V2
...
...
...
Resource        ../page_objects/Review_page.robot
Resource        ../page_objects/Base.robot
Variables       ../testdata/test_data.py
Variables       ../testdata/locators.py
Test Setup      Open Browser    ${url}    headless chrome
Test Teardown    Close All Browsers

*** Variables ***
${url}            ${REVIEW_URL}

*** Keywords ***

*** Test Cases ***
Test case 01: Check Title, Meta Desc and Canonical
    Check Title and Meta Desc and Canonical

Test case 02: Check link of Sidebar and Related Store - Popular Store is visible
    Check link Button Write a Review
    Check info Store Review
    Check info go to Store Detail
    Check info Homepage    ${Homepage_Review}
    Check Related Store visible
    Check Popular Store visible

Test case 03: Check header info
    Check about and pros - cons is visible
    Check rating and rated user is same with sidebar
    Check Title H1
    Link "Get Coupons" Btn
    Link "Go to website" Btn

Test case 04: Check info of content, Similar Store
    Assert Score with rating header
    Check Coupon Box, Review box, QA Box and Similar Store is visible
    Check link of title, button "add rating" of similar store

Test case 05: Click Get Coupon/Deal
    Get title of coupon
    Click First coupon
    Switch Window    NEW
    Check info of popup Get code/Get deal

Test case 06: Test filter of review box
#    CLick Filter Sort Oldest
    Review_page.Click Filter    ${Sort_Oldest_Review}
    Sleep    3
    Check date of review items sort from oldest to newest
#    Click Filter Most Recent
    Review_page.Click Filter    ${Sort_MostRecent_Review}
    Sleep    3
#    Check date of review items sort from newest to oldest
#    Click Rating 4 stars
#    Check all review items has 4 stars is visible
#    Check all review items has 1, 2, 3, 5 stars is invisible

# Test case 07: Ask Question
#    Fill Question: Test Question and push Enter or click Send
#    Check Test Question is visible in list Question items
