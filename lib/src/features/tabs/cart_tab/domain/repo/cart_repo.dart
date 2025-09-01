import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/entities/cart_response_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class CartRepository {
  Future<Result<CartResponseEntity, Failure>> getAllCart();
  Future<Result<CartResponseEntity, Failure>> addToCart(String productId);
  Future<Result<CartResponseEntity, Failure>> updatedProductQuantity(String productId, int count);
  Future<Result<CartResponseEntity, Failure>> removeFromCart(String productId);
}
