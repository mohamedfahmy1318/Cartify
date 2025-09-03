class ApiConstants {
  static const String players = 'players';
  //Authentication
  static const String login = 'auth/signin';
  static const String signup = 'auth/signup';
  static const String forgetPassword = 'auth/forgotPasswords';
  static const String resetPassword = 'auth/resetPassword';
  static const String verifyCode = 'auth/verifyResetCode';
  static const String updateUserData = 'users/updateMe/';
  static const String getAllUsers = 'users';
  //Categories
  static const String getAllCategories = 'categories';
  //Brands
  static const String getAllBrands = 'brands';
  //products
  static const String getProducts = 'products';
  //favorites
  static const String favorites = 'wishlist';
  //SubCategories
  static const String getSubCategories = 'subcategories';
  //Cart
  static const String cart = 'cart';
  //address
  static const String addresses = 'addresses';
  //orders
  static const String orders = 'orders';
  //change current password
  static const String changePassword = 'users/changeMyPassword';
}
