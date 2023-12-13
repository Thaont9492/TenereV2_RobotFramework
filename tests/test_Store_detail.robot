*** Setting ***

*** Variable ***


*** Test Cases ***
# Test case 01: Check Title and Meta Desc, link Breadcrumb

# Test case 02: Check link of Sidebar and Related Store - Popular Store, Competitor Store is visible
#    Button Shop now
#    Store Review
#    Homepage
#    Coupon Stats visible
#    Recommended Stores visible and has 10 items
#    Best Stores visible and has 10 items
#    Competitor box visible and has 10 items


# Test case 03: Test info of header and content
#    H1 title visible and has info of coupon stats
#    Check link "Install Tenere" button
#    Check title "Apply + Store name + coupons with one click!"
#    Check link of "Add rating" button
#    Assert content of About Store is equal with Coupon Stats Sidebar

# Test case 04: Test Filter
#    Check filter coupon, all "Get Deal" is invisible
#    Check filter deal, all "Get Code" is invisible
#    Check Filter All Offers, all coupons is visible
#    Check Sort Verified, //div[@class='box-coupon'][1]/h2 is "Verified + Store Name + Coupons"
#    Check Sort Lastest, //div[@class='box-coupon'][1]/h2 is "Lastest + Store Name + Coupons"
#    Check Sort Best, //div[@class='box-coupon'][1]/h2 is "Best + Store name + coupons"
#    Check Jumpto Today's Top, site will scroll to "box box-today-top" class

# Test case 05: Test click Get Code and not open affiliate, all coupons visible
#    Get info of title box coupon
#    Click Get Code button
#    Check Url is href of css:.d-block.mb-2
#    Switch to New Tab
#    Assert title, store name of popup get code
#    Check Codes, button Copy and Box Extension is visible
#    Click Copy Button and assert the value is equal with value of input, Copy -> Copied
#    Click close popup xpath:///img[@alt='close']
#    Check all value coupon is visible xpath://div[@class='coupon']/div[1]/div[1]/span
#    Click Copy
#    Check Copy -> Copied
#    Get info of first box coupon get code ( title, value code)
#    Click title
#    Assert info with popup (title, value code)


# Test case 06: Test click Get Deal
#    Get info of title box coupon
#    Click Get Deal button
#    Check Url is href of css:.d-block.mb-2
#    Switch to New Tab
#    Assert title, store name of popup get deal
#    Check desc ("Tip: No code needed!") and button "Continue to Store" is visible
#    Click close popup xpath:///img[@alt='close']
#    Check all value coupon is visible xpath://div[@class='coupon']/div[1]/div[1]/span
#    Get info of first box coupon get deal
#    Click title
#    Assert info with popup (title) and "Continue to store" btn is visible
