class CheckoutRequestModel {
  final String cartId;
  final ShippingAddressModel shippingAddress;

  const CheckoutRequestModel({
    required this.cartId,
    required this.shippingAddress,
  });

  Map<String, dynamic> toJson() {
    return {
      'cartId': cartId,
      'shippingAddress': shippingAddress.toJson(),
    };
  }
}

class ShippingAddressModel {
  final String details;
  final String phone;
  final String city;

  const ShippingAddressModel({
    required this.details,
    required this.phone,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      'details': details,
      'phone': phone,
      'city': city,
    };
  }
}
