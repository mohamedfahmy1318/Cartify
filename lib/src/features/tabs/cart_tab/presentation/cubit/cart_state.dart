import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/entities/cart_response_entity.dart';

final class CartState extends Equatable {
  //get all carts
  // Categories State
  final BaseStatus cartStatus;
  final CartResponseEntity? cartResponseEntity;
  final String cartErrorMessage;
  final bool isUpdating;

  const CartState({
    // Categories
    required this.cartStatus,
    this.cartResponseEntity,
    this.cartErrorMessage = ConstantManager.emptyText,
    this.isUpdating = false,
  });
  factory CartState.initial() {
    return const CartState(
      cartStatus: BaseStatus.initial,
      cartResponseEntity: null,
    );
  }
  CartState copyWith({
    BaseStatus? cartStatus,
    CartResponseEntity? cartResponseEntity,
    String? cartErrorMessage,
    bool? isUpdating,
  }) {
    return CartState(
      cartStatus: cartStatus ?? this.cartStatus,
      cartResponseEntity: cartResponseEntity ?? this.cartResponseEntity,
      cartErrorMessage: cartErrorMessage ?? this.cartErrorMessage,
      isUpdating: isUpdating ?? this.isUpdating,
    );
  }
  @override
  List<Object?> get props => [cartStatus, cartResponseEntity, cartErrorMessage, isUpdating];
}
