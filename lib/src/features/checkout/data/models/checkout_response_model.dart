import 'package:full_ecommerce_app/src/features/checkout/domain/entities/checkout_entity.dart';

class CheckoutResponseModel {
  final String status;
  final CheckoutDataModel data;

  const CheckoutResponseModel({
    required this.status,
    required this.data,
  });

  factory CheckoutResponseModel.fromJson(Map<String, dynamic> json) {
    return CheckoutResponseModel(
      status: json['status'] ?? '',
      data: CheckoutDataModel.fromJson(json['data'] ?? {}),
    );
  }
}

// Extension to convert to entity
extension CheckoutResponseModelExtension on CheckoutResponseModel {
  CheckoutEntity toEntity() {
    return CheckoutEntity(
      taxPrice: data.taxPrice,
      shippingPrice: data.shippingPrice,
      totalOrderPrice: data.totalOrderPrice,
      paymentMethodType: data.paymentMethodType,
      isPaid: data.isPaid,
      isDelivered: data.isDelivered,
      orderId: data.id,
      cartItems: data.cartItems.map((item) => CartItemEntity(
        count: item.count,
        productId: item.productId,
        price: item.price,
      )).toList(),
      shippingAddress: ShippingAddressEntity(
        details: data.shippingAddress.details,
        phone: data.shippingAddress.phone,
        city: data.shippingAddress.city,
      ),
      createdAt: data.createdAt,
      orderNumber: data.orderId,
    );
  }
}

class CheckoutDataModel {
  final double taxPrice;
  final double shippingPrice;
  final double totalOrderPrice;
  final String paymentMethodType;
  final bool isPaid;
  final bool isDelivered;
  final String id;
  final String userId;
  final List<CartItemModel> cartItems;
  final ShippingAddressResponseModel shippingAddress;
  final String createdAt;
  final String updatedAt;
  final int orderId;

  const CheckoutDataModel({
    required this.taxPrice,
    required this.shippingPrice,
    required this.totalOrderPrice,
    required this.paymentMethodType,
    required this.isPaid,
    required this.isDelivered,
    required this.id,
    required this.userId,
    required this.cartItems,
    required this.shippingAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.orderId,
  });

  factory CheckoutDataModel.fromJson(Map<String, dynamic> json) {
    return CheckoutDataModel(
      taxPrice: (json['taxPrice'] ?? 0).toDouble(),
      shippingPrice: (json['shippingPrice'] ?? 0).toDouble(),
      totalOrderPrice: (json['totalOrderPrice'] ?? 0).toDouble(),
      paymentMethodType: json['paymentMethodType'] ?? '',
      isPaid: json['isPaid'] ?? false,
      isDelivered: json['isDelivered'] ?? false,
      id: json['_id'] ?? '',
      userId: json['user'] ?? '',
      cartItems: (json['cartItems'] as List<dynamic>?)
              ?.map((item) => CartItemModel.fromJson(item))
              .toList() ??
          [],
      shippingAddress: ShippingAddressResponseModel.fromJson(
        json['shippingAddress'] ?? {},
      ),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      orderId: json['id'] ?? 0,
    );
  }
}

class CartItemModel {
  final int count;
  final String id;
  final String productId;
  final double price;

  const CartItemModel({
    required this.count,
    required this.id,
    required this.productId,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      count: json['count'] ?? 0,
      id: json['_id'] ?? '',
      productId: json['product'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
    );
  }
}

class ShippingAddressResponseModel {
  final String details;
  final String phone;
  final String city;

  const ShippingAddressResponseModel({
    required this.details,
    required this.phone,
    required this.city,
  });

  factory ShippingAddressResponseModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressResponseModel(
      details: json['details'] ?? '',
      phone: json['phone'] ?? '',
      city: json['city'] ?? '',
    );
  }
}
