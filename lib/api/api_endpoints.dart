class ApiEndPoints{
  static const String baseUrl = 'https://ecommerce.routemisr.com/';
  static const String loginApi = 'api/v1/auth/signin';
  static const String registerApi = 'api/v1/auth/signup';
  static const String categoriesApi = 'api/v1/categories';
  static const String brandsApi = 'api/v1/brands';
  static const String productsApi = 'api/v1/products';
  static const String addToCartApi = 'api/v1/cart';
  static const String addToWishListApi = 'api/v1/wishlist';
  static const String deleteCartApi = 'api/v1/cart/{productId}';
  static const String deleteWishListApi = 'api/v1/wishlist/{productId}';
}