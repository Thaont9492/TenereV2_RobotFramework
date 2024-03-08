# ------ Locator Page Review ------
# Header
Title_H1_Review = "css:h1"
Rating_Review = 'xpath://div[@class="stars"]/span[1]'
Rating_Count_Review = 'xpath://div[@class="stars"]/span[3]'
Desc_Review = "css:.desc"
GetCoupon_Review = "css:.box-info > a:nth-of-type(1)"
GoTo_Review = "css:.box-info > a:nth-of-type(2)"
# Sidebar
Logo_Review = "css:img[alt='store-logo']"
Rating_Sidebar_Review = "css:.rate-desc"
WriteAReview_Review = "xpath://aside[@class='sidebar']/div/a[1]"
StoreReviewBtn_Review = "xpath://aside[@class='sidebar']/div/a[2]"
StoreCouponBtn_Review = "xpath://aside[@class='sidebar']/div/a[3]"
Homepage_Review = "xpath://aside[@class='sidebar']/div/a[4]"
# Coupon Stats
AverageSaving_Stats = "css:p:nth-of-type(1) > b"
VerifiedCp_Stats = "css:p:nth-of-type(2) > b"
BestDiscount_Stats = "css:p:nth-of-type(3) > b"
CouponAvailable_Stats = "css:p:nth-of-type(4) > b"
# Content
Overall_Rating_Review = "css:.left .score"
CountReview_Review = "css:.count-review"
Title_Pros_Cons_Review = "css:.box > .title"
Pros_Cons_Review = "css:.mb-30px.mt-20px"
# Coupon Box
Coupon_Box_Review = "css:.box.box-coupons"
GetMoreCpnBtn_Review = "xpath:///button[@innertext='Get more code']"
GetCodeFirst_Review = "css:.swiper-wrapper > div:nth-of-type(1) .get-code"
DiscountFirst_Review = "css:.swiper-wrapper > div:nth-of-type(1) .coupon__offer"
TitleCpnFirst_Review = "xpath://div[@class='coupon__left'][1]/h3"

# Review Box
Review_Box_Review = 'css:.box.box-reviews'
ReviewItem_Review = 'css:.review'
SortByFilter_Review = "xpath://div[@class='filter-nav']/div[1]"
Sort_MostRecent_Review = "css:.cover-sortBy > li:nth-of-type(1)"
Sort_Oldest_Review = "css:.cover-sortBy > li:nth-of-type(2)"
RatingFilter_Review = "xpath://div[@class='filter-nav']/div[2]"
Rating_All_Review = "css:.cover-rating > li:nth-of-type(1)"

# QA Box
QA_Box_Review = 'css:.box.box-question-answer'
CountQAItem_Review = "xpath://div[@class='box-question-answer box']/div[1]/span"
SortQAFilter_Review = 'css:select#js_question'
SortQA_Lastest_Review = "xpath://select[#'js_question']/option[@innertext='Latest']"
SortQA_Oldest_Review = "xpath://select[#'js_question']/option[@innertext='Oldest']"
AskQuestionInput_Review = "css:.ask-a-question [type]"

# Related Article
Title_Related_Review = "css:.box.box-article > .title-box"
Title_ArticleFirst_Review = "xpath://div[@class='article'][1]/h3"

# Similar Store
SeeAllStoreBtn_Review = 'link_text:See All Stores'
Similar_Box_Review = 'css:.box.box-store'
Title_SimilarFirst_Review = 'css:.store-grid > div:nth-of-type(1)  h3 > a'
Logo_SimilarFirst_Review = 'xpath://div[@class="store-grid"]/div[1]/div[1]/img'
Rating_SimilarFirst_Review = 'xpath://div[@class="store-grid"]/div[1]/div[2]/span'
AddRating_SimilarFirst_Review = 'css:.store-grid > div:nth-of-type(1) .color-main > a'
Category_SimilarFirst_Review = 'xpath://div[@class="store-grid"]/div[1]/div[2]/div[2]'

# ------ Locator Page Store Detail ------
# Sidebar
ShopNowBtn_Store = "css:a#shop-now"
Logo_Store = "css:.store-image > img"
StoreRate_Store = "css:.storeRate"
RateUserCount_Store = "css:.rateUserCount"
LinkReview_Store = "xpath://aside[@class='sidebar']/div/a[2]"
HomeSidebar_Store = "xpath://aside[@class='sidebar']/div/a[3]"
StoreSidebar_Store = "css:.box-sidebar-total-info .link:nth-child(8)"
H3Sidebar_Store = "css:.box-sidebar-total-info h3"
RecommendedTitle_Store = "css:.sidebar .sidebar-group:nth-of-type(3)"
BestTitle_Store = "css:.sidebar .sidebar-group:nth-of-type(4)"

# Main Box
Title_H1_Store = "css:.store-title"
AddRating_Store = "css:.items-center > span > a"
CompetitorTitle_Store = "css:.box-competitor-coupon"

Filter_Store = "css:div#js-filter"
Filter_Deal_Store = "css:.cover-filter > li:nth-of-type(3)"
Filter_Coupon_Store = "css:.cover-filter > li:nth-of-type(2)"
Fitler_All_Store = "css:.cover-filter > li:nth-of-type(1)"

Sort_Store = "css:div#jsFilter > div:nth-of-type(2)"
Sort_Verified_Store = "css:.cover-sort > li:nth-of-type(2)"
Sort_Latest_Store = "css:.cover-sort > li:nth-of-type(3)"
Sort_Best_Store = "css:.cover-sort > li:nth-of-type(1)"

JumpTo_Store = "css:.item.jump"


# Popup Get Code/Get Deal
Title_FirstCP_Store = "xpath://div[@class='coupon'][1]//h3/span"
Title_PopUp = "css:.coupon-name"
Btn_GetCode_FirstCP = "xpah://button[@innertext='Get Code'][1]"
Btn_Copy_Popup = "css:#btn-copy"
Storename_Popup = "css:a#go-to-site"
First_CopyBtn_Store = "xpath://button[@class='bg-[#578d3f] text-white h-[46px] px-4'][1]"
Close_Popup = 'css:.shutdown'

Btn_GetDeal_FirstCP = "xpath://button[@innertext='Get Deal'][1]"
Btn_ContinueToStore_Popup = "css:.go-to"
