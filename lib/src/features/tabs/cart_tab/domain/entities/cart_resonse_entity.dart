import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/products_entity.dart';

class CartResponseEntity extends Equatable {
	final String? status;
	final int? numOfCartItems;
	final String? cartId;
	final CartEntity? data;

	const CartResponseEntity({
		this.status,
		this.numOfCartItems,
		this.cartId,
		this.data,
	});

	@override
	List<Object?> get props => [status, numOfCartItems, cartId, data];
}

class CartEntity extends Equatable {
	final String? id;
	final String? cartOwner;
	final List<CartItemEntity>? products;
	final String? createdAt;
	final String? updatedAt;
	final int? v;
	final int? totalCartPrice;

	const CartEntity({
		this.id,
		this.cartOwner,
		this.products,
		this.createdAt,
		this.updatedAt,
		this.v,
		this.totalCartPrice,
	});

	@override
	List<Object?> get props => [
				id,
				cartOwner,
				products,
				createdAt,
				updatedAt,
				v,
				totalCartPrice,
			];
}

class CartItemEntity extends Equatable {
	final int? count;
	final String? id;
	final ProductEntity? product;
	final int? price;

	const CartItemEntity({
		this.count,
		this.id,
		this.product,
		this.price,
	});

	@override
	List<Object?> get props => [count, id, product, price];
}

