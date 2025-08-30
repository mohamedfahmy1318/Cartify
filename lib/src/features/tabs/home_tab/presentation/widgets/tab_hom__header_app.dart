import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/helpers/location_services.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/custom_search_app_field.dart';
import 'package:geocoding/geocoding.dart';

class TabHomeHeader extends StatefulWidget {
  final String titleSearch;

  const TabHomeHeader({super.key, required this.titleSearch});

  @override
  State<TabHomeHeader> createState() => _TabHomeHeaderState();
}

class _TabHomeHeaderState extends State<TabHomeHeader> {
  String? _currentLocation;

  final _locationService = LocationService();
  final _geocodingService = GeocodingService();
  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    final position = await _locationService.getCurrentPosition();
    if (position != null) {
      final address = await _geocodingService.getAddressFromLatLng(
        position.latitude,
        position.longitude,
      );
      setState(() {
        _currentLocation = address ?? "Unknown Location";
      });
    } else {
      setState(() {
        _currentLocation = "Location Disabled";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppText(
              'Cartify',
              fontSize: FontSize.s26,
              fontWeight: FontWeightManager.bold,
              color: AppColors.primary,
            ),
            const Spacer(),
            AppText(
              _currentLocation ?? "Loading...",
              fontSize: FontSize.s16,
              fontWeight: FontWeightManager.medium,
              color: AppColors.grey,
            ),
            const Icon(Icons.location_on_outlined, color: AppColors.grey),
          ],
        ),
        12.szH,
        Row(
          children: [
            CustomSearchAppField(titleSearch: widget.titleSearch),
            IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.primary,
                size: AppSize.sH25,
              ),
              onPressed: () {
                // Handle shopping cart icon press
              },
            ),
          ],
        ),
      ],
    );
  }
}

class GeocodingService {
  Future<String?> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        return "${place.locality}, ${place.country}";
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
