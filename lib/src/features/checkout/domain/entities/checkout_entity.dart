class CheckoutEntity {
  final double taxPrice;
  final double shippingPrice;
  final double totalOrderPrice;
  final String paymentMethodType;
  final bool isPaid;
  final bool isDelivered;
  final String orderId;
  final List<CartItemEntity> cartItems;
  final ShippingAddressEntity shippingAddress;
  final String createdAt;
  final int orderNumber;

  const CheckoutEntity({
    required this.taxPrice,
    required this.shippingPrice,
    required this.totalOrderPrice,
    required this.paymentMethodType,
    required this.isPaid,
    required this.isDelivered,
    required this.orderId,
    required this.cartItems,
    required this.shippingAddress,
    required this.createdAt,
    required this.orderNumber,
  });
}

class CartItemEntity {
  final int count;
  final String productId;
  final double price;

  const CartItemEntity({
    required this.count,
    required this.productId,
    required this.price,
  });
}

class ShippingAddressEntity {
  final String details;
  final String phone;
  final String city;

  const ShippingAddressEntity({
    required this.details,
    required this.phone,
    required this.city,
  });
}
