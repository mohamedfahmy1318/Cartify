import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/extensions/error_handler_extension.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/data/data_sources/cart_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/entities/cart_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/repo/cart_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _remoteDataSource;

  CartRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<CartResponseEntity, Failure>> getAllCart() {
    return _remoteDataSource
        .getAllCart()
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();

  }
  
  @override
  Future<Result<CartResponseEntity, Failure>> addToCart(String productId) {
    return _remoteDataSource
        .addToCart(productId)
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }
  
  @override
  Future<Result<CartResponseEntity, Failure>> updatedProductQuantity(String productId, int count) {
    return _remoteDataSource
        .updatedProductQuantity(productId, count)
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }
  
  @override
  Future<Result<CartResponseEntity, Failure>> removeFromCart(String productId) {
    return _remoteDataSource
        .removeFromCart(productId)
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }
}