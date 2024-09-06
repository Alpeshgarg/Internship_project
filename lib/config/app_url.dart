String apiUrl = "https://wpdemo.hireawsexpert.com/api/v1";

class AppUrls{
  static String sendOtp = "$apiUrl/auth/send-otp";
  static String verifyOtp = "$apiUrl/auth/verify-otp";
  static String getBanners = "$apiUrl/banners";
  static String getOtherBanners = "$apiUrl/other-banners";
  static String getStores = "$apiUrl/stores/popular";
  static String getPopularItems = "$apiUrl/items/popular";
  static String mostReviewedItems = "$apiUrl/items/most-reviewed";
  static String recommendedItems = "$apiUrl/items/recommended";
  static String categoriesItems = "$apiUrl/categories/items";
  static String storeDetails = "$apiUrl/stores/details";
  static String addItemToCart = "$apiUrl/customer/cart/add";
  static String updateItemCart = "$apiUrl/customer/cart/update";
  static String getCartList = "$apiUrl/customer/cart/list";
  static String getUserInfo = "$apiUrl/customer/info";
  static String updateFCMToken = "$apiUrl/customer/cm-firebase-token";
  static String getUserAddress = "$apiUrl/customer/address/list";
  static String addUserAddress = "$apiUrl/customer/address/add";
  static String getUserZoneId = "$apiUrl/config/get-zone-id";
}