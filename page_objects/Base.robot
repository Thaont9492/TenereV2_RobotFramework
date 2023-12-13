*** Setting ***
Documentation    A resource file with reusable keywords ana variables
...
...             The system specific keywords created here form our own
...             domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary.
Library         SeleniumLibrary
Library         Collections
Library         page_objects/LambdaTestStatus.py

*** Variable ***

*** Keywords ***
Open The Browser
    [Arguments]    ${browser}    ${url}
    Create Webdriver    ${browser}
    Go To    ${url}

Close Browser Session
    Report Lambdatest Status
    ...  ${TEST_NAME}
    ...  ${TEST_STATUS}
    Close Browser

Wait Until Element passed is located on Page
	[Arguments]    ${page_locator}
	Wait Until Element Is Visible    ${page_locator}

Wait Until Element is invisible on Page
	[Arguments]    ${page_locator_2}
	Wait Until Element Is Invisible On Page    ${page_locator_2}

Wait Until Element is clickable on Page
	[Arguments]    ${page_locator_3}
	Wait Until Element Is Clickable On Page    ${page_locator_3}


