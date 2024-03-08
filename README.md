# Tenere Team Robot Framework
Functional Test Web Automation with RobotFramework using Python and Selenium.

# Prerequisites
1) Install Python (pip included).
2) Install Supporting IDE (Pycharm IDE preferred).
3) Install robotframework. 
4) Install selenium and robotframework-selenium library using pip commands.

Python 3 -> https://www.python.org/downloads/

pip install robotframework

pip install --upgrade robotframework-pageobjectlibrary

pip install --upgrade robotframework-seleniumlibrary

pip install webdrivermanager

# Test Suite
1. Test API for Review and Store Detail
2. Test Review Page
3. Test Store Detail - KFS

# Run Test
1. Run API Test for Review and Store Detail:  robot .\API\Tests\*
2. Run Review_TestCasesAPI: robot .\API\Tests\Review_TestCasesAPI.robot
3. Run Storedetail_TestCasesAPI: robot .\API\Tests\Store_TestCasesAPI.robot
4. Run Test case for Review and Store Dtail: robot .\tests\*
4. Run Test Review Page: robot .\tests\test_Review_page.robot
5. Run Test Store Detail: robot .\tests\test_Store_detail.robot

# Change info
1. Change domain, store name for test cases in .\testdata\test_data.py
2. Change domain for API test in .\API\Resource