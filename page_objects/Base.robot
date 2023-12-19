*** Setting ***
Documentation    A resource file with reusable keywords ana variables
...
...             The system specific keywords created here form our own
...             domain specific language. They utilize keywords provided
...             by the imported SeleniumLibrary.
Library         SeleniumLibrary
Library         Collections
Library         DateTime
Library         page_objects/LambdaTestStatus.py

*** Variable ***
${month}
${year}

*** Keywords ***
Open The Browser
    [Arguments]    ${browser}    ${url}
    Create Webdriver    ${browser}
    Go To    ${url}
    Maximize Browser Window

Close Browser Session
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

Get Date Time
	${date}=    Get Current Date   result_format=datetime
    ${month}=    Convert Date    ${date}    result_format=%B
    ${year}=    Convert Date    ${date}     result_format=%Y

    Set Global Variable    ${month}
    Set Global Variable    ${year}

