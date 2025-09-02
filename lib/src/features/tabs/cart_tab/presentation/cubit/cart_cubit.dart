import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/use_cases/add_to_cart_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/use_cases/get_all_cart_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/use_cases/remove_cart_item.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/use_cases/update_product_quentity.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(
    this.getAllCartUseCase,
    this.addToCartUseCase,
    this.updateProductQuantityUseCase,
    this.removeCartItemUseCase,
  ) : super(CartState.initial());

  final GetAllCartUseCase getAllCartUseCase;
  final AddToCartUseCase addToCartUseCase;
  final UpdateProductQuantityUseCase updateProductQuantityUseCase;
  final RemoveCartItemUseCase removeCartItemUseCase;

  // GET CART METHODS
  void fetchAllCart() async {
    emit(state.copyWith(cartStatus: BaseStatus.loading));

    final result = await getAllCartUseCase.call();
    result.when(
      (success) => emit(
        state.copyWith(
          cartStatus: BaseStatus.success,
          cartResponseEntity: success,
        ),
      ),
      (error) => emit(
        state.copyWith(
          cartStatus: BaseStatus.error,
          cartErrorMessage: error.message,
        ),
      ),
    );
  }

  //ADD To Cart
  void addToCart(String productId) async {
    emit(state.copyWith(cartStatus: BaseStatus.loading));

    final result = await addToCartUseCase.call(productId);
    result.when(
       (success) {
      // أولاً نخزن الريسبونس بتاع الـ add
      emit(
        state.copyWith(
          cartStatus: BaseStatus.success,
          cartResponseEntity: success,
        ),
      );
      // ثانياً نعمل refetch عشان نجيب كل الكارت من السيرفر
      fetchAllCart();
    },
      (error) => emit(
        state.copyWith(
          cartStatus: BaseStatus.error,
          cartErrorMessage: error.message,
        ),
      ),
    );
  }

  // UPDATE PRODUCT QUANTITY
  void updateProductQuantity(String productId, int count) async {
    emit(state.copyWith(isUpdating: true));

    final result = await updateProductQuantityUseCase.call(productId, count);
    result.when(
      (success) => emit(
        state.copyWith(
          cartStatus: BaseStatus.success,
          cartResponseEntity: success,
          isUpdating: false,
        ),
      ),
      (error) => emit(
        state.copyWith(
          cartStatus: BaseStatus.error,
          cartErrorMessage: error.message,
          isUpdating: false,
        ),
      ),
    );
  }
  // Delete item from cart
  void removeCartItem(String productId) async {
    emit(state.copyWith(isUpdating: true));

    final result = await removeCartItemUseCase.call(productId);
    result.when(
      (success) => emit(
        state.copyWith(
          cartStatus: BaseStatus.success,
          cartResponseEntity: success,
          isUpdating: false,
        ),
      ),
      (error) => emit(
        state.copyWith(
          cartStatus: BaseStatus.error,
          cartErrorMessage: error.message,
          isUpdating: false,
        ),
      ),
    );
  }
  // Check if product is in cart
  bool isInCart(String productId) {
    final products = state.cartResponseEntity?.data?.products;
    if (products == null) return false;

    return products.any((item) => item.product?.id == productId);
  }
}