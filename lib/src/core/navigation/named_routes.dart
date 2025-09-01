enum NamedRoutes {
  login('/login'),
  appHome('/app-home'),
  register('/register'),
  pinCode('/pin-code'),
  viewAllBanners('/view-all-banners'),
  bannerProducts('/banner-products'),
  productDetail('/product-detail'),
  viewAllProducts('/view-all-products');

  final String routeName;

  const NamedRoutes(this.routeName);
}
