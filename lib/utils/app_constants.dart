class AppConstants{
  static const String APP_NAME = "DBFood";
  static const int APP_VERSION = 1;

  // -------servers-------

  // static const String BASE_URL = "http://mvs.bslmeiyu.com"; // main server
  // static const String BASE_URL = "http://127.0.0.1:8000";  // localhost for ios
  // static const String BASE_URL = "http://10.0.2.2:8000"; // localhost for android
  static const String BASE_URL = "http://192.168.0.106:8000"; // wi-fi
  // static const String BASE_URL = "http://192.168.244.105"; // airtel


  static const String POPULAR_PRODUCT_URI = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URI = "/api/v1/products/recommended";
  static const String UPLOAD_URL = "/uploads/";
  static const String DRINKS_URI = "/api/v1/products/drinks";

  //user and auth end points
  static const String REGISTRATION_URI = "/api/v1/auth/register";
  static const String LOGIN_URI = "/api/v1/auth/login";
  static const String USER_INFO_URI = "/api/v1/customer/info";

  //new
  static const String USER_ADDRESS = "user_address";
  static const String ADD_USER_ADDRESS = "/api/v1/customer/address/add";
  static const String ADDRESS_LIST_URI = "/api/v1/customer/address/list";

  // config
  static const String GEOCODE_URI = '/api/v1/config/geocode-api';
  static const String ZONE_URI = '/api/v1/config/get-zone-id';
  static const String SEARCH_LOCATION_URI = '/api/v1/config/place-api-autocomplete';
  static const String PLACE_DETAILS_URI = '/api/v1/config/place-api-details';

  // orders
  static const String PLACE_ORDER_URI = '/api/v1/customer/order/place';
  static const String ORDER_LIST_URI = '/api/v1/customer/order/list';
  static const String PHONE = "";
  static const String PASSWORD = "";
  static const String TOKEN = "";
  static const String CART_LIST = "cart-list";
  static const String CART_HISTORY_LIST = "cart-history-list";

  static const String TOKEN_URI = '/api/v1/customer/cm-firebase-token';

}
