class AppLink {
  static const String server = "http://10.0.2.2/ecommerce";
  static const String test = "$server/test.php";

//=================== Images ================//
  static const String images = '$server/upload';
  static const String imagesCategories = '$images/categories';
  static const String imagesItems = '$images/items';

//=============== Auth ===============//
  static const String signUp = '$server/auth/signup.php';
  static const String verifycode = '$server/auth/verifycode.php';
  static const String login = '$server/auth/login.php';
  static const String checkEmail = '$server/forget_password/check_email.php';
  static const String verifycodeForgetPassword =
      '$server/forget_password/verifycode.php';
  static const String resetPassword =
      '$server/forget_password/reset_password.php';
  static const String resend = '$server/auth/resend.php';
  static const String home = '$server/home.php';

//======== Favorite ========//
  static const String favoriteAdd = '$server/favorite/add.php';
  static const String favoriteRemove = '$server/favorite/remove.php';
  static const String favoriteView = '$server/favorite/view.php';

//======== Cart ========//
  static const String cartView = '$server/cart/view.php';
  static const String cartAdd = '$server/cart/add.php';
  static const String cartDelete = '$server/cart/delete.php';

//======= Address =======/
  static const String addressView = '$server/address/view.php';
  static const String addressAdd = '$server/address/add.php';
  static const String addressDelete = '$server/address/delete.php';
  static const String addressEdit = '$server/address/edit.php';

//========= Copoun ======/
  static const String copounCheck = '$server/coupon/valid_check.php';
  static const String couponCounter = '$server/coupon/coupon_counter.php';

//======== Orders =======/
  static const String checkout = '$server/orders/checkout.php';
  static const String allOrders = '$server/orders/all_orders.php';
}
