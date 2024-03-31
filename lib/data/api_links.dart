class ApisLink {
  ApisLink._();
  static const baseUrl = 'https://watchstore.sasansafari.com';
  static const versionRoute = '/public/api/v1';
  static const sendSmsApi = '$versionRoute/send_sms';
  static const checkSmsApi = '$versionRoute/check_sms_code';
  static const registerApi = '$versionRoute/register';
  static const productByBrand = '$versionRoute/products_by_brand/';
  static const productByCategory = '$versionRoute/products_by_category/';
  static const newestProduct = '/newest_products';
  static const cheapestProduct = '/cheapest_products';
  static const mostExpensiveProduct = '/most_expensive_products';
  static const mostViewedProducts = '/most_viewed_products';
  static const search = '$versionRoute/all_products';
  static const home = '$versionRoute/home';
  static const productDetails = '$versionRoute/product_details/';
  static const userCart = '$versionRoute/user_cart';
  static const addToCart = '$versionRoute/add_to_cart';
  static const removeFromCart = '$versionRoute/remove_from_cart';
  static const deleteFromCart = '$versionRoute/delete_from_cart';
  static const profile = '$versionRoute/profile';
  static const payment = '$versionRoute/payment';
}
