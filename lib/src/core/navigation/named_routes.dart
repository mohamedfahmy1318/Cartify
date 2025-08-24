enum NamedRoutes {
  login('/login'),
  appHome('/app-home'),
  register('/register'),
  pinCode('/pin-code'),
  viewAllCategory('/view-all-categories');

  final String routeName;

  const NamedRoutes(this.routeName);
}
