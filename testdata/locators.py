from selenium.webdriver.common.by import By

# ------ Locator Page Review ------
# Header
Title_H1_Review = (By.CSS_SELECTOR, "h1")
Rating_Review = (By.XPATH, '//div[@class="stars"]/span[1]')
Rating_Count_Review = (By.XPATH, '//div[@class="stars"]/span[3]')
Desc_Review = (By.CSS_SELECTOR, ".desc")
GetCoupon_Review = (By.XPATH, "///button[@innertext='Get Coupons']")
GoTo_Review = (By.XPATH, "///button[@innertext='Go to webiste']")
# Sidebar
Logo_Review = By.CSS_SELECTOR, "img[alt='store-logo']"
WriteAReview_Review = (By.XPATH, "///button[@innertext='Write a Review']")
StoreReviewBtn_Review = (By.XPATH, "//aside[@class='sidebar']/div/a[2]")
StoreCouponBtn_Review = (By.XPATH, "//aside[@class='sidebar']/div/a[3]")
Homepage_Review = (By.LINK_TEXT, "Tenere Homepage")
# Coupon Stats
VerifiedCp_Review = (By.CSS_SELECTOR, "p:nth-of-type(2) > b")
BestDiscount_Review = (By.CSS_SELECTOR, "p:nth-of-type(3) > b")
CouponAvailable_Review = (By.CSS_SELECTOR, "p:nth-of-type(4) > b")
# Content
Overall_Rating_Review = (By.CSS_SELECTOR, ".left .score")
CountReview_Review = (By.CSS_SELECTOR, ".count-review")
Title_Pros_Cons_Review = (By.CSS_SELECTOR, ".box > .title")
# Coupon Box
Title_Coupon_Box_Review = (By.CSS_SELECTOR, ".box-coupons.box .title-box")
GetMoreCpnBtn_Review = (By.XPATH, "///button[@innertext='Get more code']")
GetCodeFirst_Review = (By.CSS_SELECTOR, ".swiper-wrapper > div:nth-of-type(1) .get-code")
DiscountFirst_Review = (By.CSS_SELECTOR, ".swiper-wrapper > div:nth-of-type(1) .coupon__offer")
TitleCpnFirst_Review = (By.XPATH, '//div[1]/div[@class="coupon"]//h3')
VerifiedCpnFirst_Review = (By.XPATH, '//div[1]/div[@class="coupon"]/div[1]//span[1]')
UsesCpnFirst_Review = (By.XPATH, '//div[1]/div[@class="coupon"]/div[1]//span[2]')
# Review Box
Title_Review_Box_Review = (By.CSS_SELECTOR, '.box.box-reviews > .title-box')
ReviewItem_Review = (By.CSS_SELECTOR, '.review')
SortByFilter_Review = (By.XPATH, "//div[@class='filter-nav']/div[1]")
Sort_MostRecent_Review = (By.CSS_SELECTOR, ".cover-sortBy > li:nth-of-type(1)")
Sort_Oldest_Review = (By.CSS_SELECTOR, ".cover-sortBy > li:nth-of-type(2)")
RatingFilter_Review = (By.XPATH, "//div[@class='filter-nav']/div[2]")
Rating_All_Review = (By.CSS_SELECTOR, ".cover-rating > li:nth-of-type(1)")

# QA Box
Title_QA_Box_Review = (By.CSS_SELECTOR, '.box.box-question-answer > .title-box')
QAItem_Review = (By.CSS_SELECTOR, '.question')
CountQAItem_Review = (By.XPATH, "//div[@class='box-question-answer box']/div[1]/span")
SortQAFilter_Review = (By.CSS_SELECTOR, 'select#js_question')
SortQA_Lastest_Review = (By.XPATH, "//select[#'js_question']/option[@innertext='Latest']")
SortQA_Oldest_Review = (By.XPATH, "//select[#'js_question']/option[@innertext='Oldest']")
AskQuestionInput_Review = (By.CSS_SELECTOR, ".ask-a-question [type]")

# Related Article
Title_Related_Review = (By.CSS_SELECTOR, ".box.box-article > .title-box")
Title_ArticleFirst_Review = (By.XPATH, "//div[@class='article'][1]/h3")

# Similar Store
SeeAllStoreBtn_Review = (By.LINK_TEXT, 'See All Stores')
Title_SimilarFirst_Review = (By.XPATH, '//div[@class="store-grid"]/div[1]//a')
Logo_SimilarFirst_Review = (By.XPATH, '//div[@class="store-grid"]/div[1]/div[1]/img')
Rating_SimilarFirst_Review = By.XPATH, '//div[@class="store-grid"]/div[1]/div[2]/span'
AddRating_SimilarFirst_Review = By.XPATH, '//div[@class="store-grid"]/div[1]/div[2]/span/span'
Category_SimilarFirst_Review = By.XPATH, '//div[@class="store-grid"]/div[1]/div[2]/div[2]'


# ------ Locator Page Store Detail ------
# Sidebar
ShopNowBtn_Store = By.CSS_SELECTOR, "a#shop-now"
Logo_Store = By.CSS_SELECTOR, ".store-image > img"
StoreRate_Store = By.CSS_SELECTOR, ".storeRate"
RateUserCount_Store = By.CSS_SELECTOR, ".rateUserCount"
LinkReview_Store = By.CSS_SELECTOR, ".box-sidebar-total-info .link:nth-child(7)"
HomeSidebar_Store = By.CSS_SELECTOR, ".box-sidebar-total-info .link:nth-child(9)"
StoreSidebar_Store = By.CSS_SELECTOR, ".box-sidebar-total-info .link:nth-child(8)"
H3Sidebar_Store = By.CSS_SELECTOR, ".box-sidebar-total-info h3"


