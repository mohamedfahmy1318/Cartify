import 'package:full_ecommerce_app/src/features/banners_products_tab/data/models/products_model.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/entities/cart_response_entity.dart';

/// Cart API response model
/// Example payload:
/// {
///   "status": "success",
///   "numOfCartItems": 2,
///   "cartId": "...",
///   "data": { ...cart... }
/// }
class CartResponseModel extends CartResponseEntity {
	const CartResponseModel({
		super.status,
		super.numOfCartItems,
		super.cartId,
		super.data,
    super.message,
	});

	factory CartResponseModel.fromJson(Map<String, dynamic> json) {
			return CartResponseModel(
				status: json['status'] as String? ?? '',
				numOfCartItems: json['numOfCartItems'] as int? ?? 0,
				cartId: json['cartId'] as String? ?? '',
				data: CartModel.fromJson((json['data'] as Map<String, dynamic>? ?? {})),
				message: json['message'] as String? ?? '',
			);
	}

	Map<String, dynamic> toJson() {
		return {
			'status': status,
			'numOfCartItems': numOfCartItems,
			'cartId': cartId,
			'message': message,
			'data': (data as CartModel).toJson(),
		};
	}
  CartResponseEntity toEntity() {
    return CartResponseEntity(
      status: status,
      numOfCartItems: numOfCartItems,
      cartId: cartId,
      message: message,
		data: (data as CartModel?)?.toEntity(),
    );
  }
}

/// Cart content model
class CartModel extends CartEntity {
	const CartModel({
		super.id,
		super.cartOwner,
		super.products,
		super.createdAt,
		super.updatedAt,
		super.v,
		super.totalCartPrice,
	});

	factory CartModel.fromJson(Map<String, dynamic> json) {
		return CartModel(
			  id: json['_id'] as String? ?? '',
			  cartOwner: json['cartOwner'] as String? ?? '',
			  products: (json['products'] as List?)
					  ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
					  .toList() ??
				  <CartItemModel>[],
			  createdAt: json['createdAt'] as String? ?? '',
			  updatedAt: json['updatedAt'] as String? ?? '',
			  v: json['__v'] as int? ?? 0,
			  totalCartPrice: json['totalCartPrice'] as int? ?? 0,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'_id': id,
			'cartOwner': cartOwner,
			  'products': products
					  ?.map((e) => (e as CartItemModel).toJson())
					  .toList() ??
				  [],
			'createdAt': createdAt,
			'updatedAt': updatedAt,
			'__v': v,
			'totalCartPrice': totalCartPrice,
		};
	}
  CartEntity toEntity() {
    return CartEntity(
      id: id,
      cartOwner: cartOwner,
		  products:
			  products?.map((e) => (e as CartItemModel).toEntity()).toList(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
      totalCartPrice: totalCartPrice,
    );
  }
}

/// Cart line item model
class CartItemModel extends CartItemEntity {
	const CartItemModel({
		super.count,
		super.id,
		required super.product,
		super.price,
	});

	factory CartItemModel.fromJson(Map<String, dynamic> json) {
		return CartItemModel(
			  count: json['count'] as int? ?? 0,
			  id: json['_id'] as String? ?? '',
			  product: ProductModel.fromJson(
				  (json['product'] as Map<String, dynamic>? ?? {})),
			  price: json['price'] as int? ?? 0,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			  'count': count,
			  '_id': id,
			  'product': product != null ? (product as ProductModel).toJson() : {},
			  'price': price,
		};
	}
  CartItemEntity toEntity() {
    return CartItemEntity(
      count: count,
      id: id,
		product: product,
      price: price,
    );
  }
}

