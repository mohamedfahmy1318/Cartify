enum NamedRoutes {
  login('/login'),
  appHome('/app-home'),
  register('/register'),
  pinCode('/pin-code');

  final String routeName;

  const NamedRoutes(this.routeName);
}
