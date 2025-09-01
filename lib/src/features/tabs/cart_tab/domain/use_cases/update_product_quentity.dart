import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/entities/cart_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/repo/cart_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class UpdateProductQuantityUseCase {
  final CartRepository _cartRepository;

  UpdateProductQuantityUseCase(this._cartRepository);

  Future<Result<CartResponseEntity, Failure>> call(String productId, int count) {
    return _cartRepository.updatedProductQuantity(productId, count);
  }
}