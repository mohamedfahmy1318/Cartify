enum NamedRoutes {
  login('/login'),
  appHome('/app-home'),
  register('/register'),
  pinCode('/pin-code'),
  viewAllCategory('/view-all-categories'),
  viewAllBanners('/view-all-banners'),
  bannerProducts('/banner-products');

  final String routeName;

  const NamedRoutes(this.routeName);
}
