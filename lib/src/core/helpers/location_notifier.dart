import 'package:flutter/foundation.dart';
import 'package:full_ecommerce_app/src/core/helpers/location_services.dart';
import 'package:full_ecommerce_app/src/core/helpers/geocoding_service.dart';

class LocationNotifier extends ValueNotifier<String?> {
  static final LocationNotifier _instance = LocationNotifier._internal();
  factory LocationNotifier() => _instance;
  LocationNotifier._internal() : super(null);

  final LocationService _locationService = LocationService();
  final GeocodingService _geocodingService = GeocodingService();

  Future<void> fetchLocation() async {
    try {
      final position = await _locationService.getCurrentPosition();
      if (position != null) {
        final address = await _geocodingService.getAddressFromLatLng(
          position.latitude,
          position.longitude,
        );
        value = address ?? "Unknown Location";
      } else {
        value = "Location Disabled";
      }
    } catch (e) {
      value = "Location Error";
    }
  }
}
