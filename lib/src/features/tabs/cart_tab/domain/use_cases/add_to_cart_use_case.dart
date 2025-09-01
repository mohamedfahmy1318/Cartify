import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/entities/cart_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/repo/cart_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class AddToCartUseCase {
  final CartRepository _cartRepository;

  AddToCartUseCase(this._cartRepository);

  Future<Result<CartResponseEntity, Failure>> call(String productId) {
    return _cartRepository.addToCart(productId);
  }
}