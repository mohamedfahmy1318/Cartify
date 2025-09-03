import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/checkout_entity.dart';

class CheckoutState {
  final BaseStatus checkoutStatus;
  final CheckoutEntity? checkoutEntity;
  final String errorMessage;

  const CheckoutState({
    required this.checkoutStatus,
    this.checkoutEntity,
    required this.errorMessage,
  });

  factory CheckoutState.initial() {
    return const CheckoutState(
      checkoutStatus: BaseStatus.initial,
      checkoutEntity: null,
      errorMessage: '',
    );
  }

  CheckoutState copyWith({
    BaseStatus? checkoutStatus,
    CheckoutEntity? checkoutEntity,
    String? errorMessage,
  }) {
    return CheckoutState(
      checkoutStatus: checkoutStatus ?? this.checkoutStatus,
      checkoutEntity: checkoutEntity ?? this.checkoutEntity,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
