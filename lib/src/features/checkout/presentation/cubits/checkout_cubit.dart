import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/checkout_request_model.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/use_cases/create_cash_order_use_case.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CreateCashOrderUseCase _createCashOrderUseCase;

  CheckoutCubit(this._createCashOrderUseCase) : super(CheckoutState.initial());

  Future<void> createCashOrder({
    required String cartId,
    required String addressDetails,
    required String phone,
    required String city,
  }) async {
    try {
      emit(state.copyWith(checkoutStatus: BaseStatus.loading));

      final request = CheckoutRequestModel(
        cartId: cartId,
        shippingAddress: ShippingAddressModel(
          details: addressDetails,
          phone: phone,
          city: city,
        ),
      );

      final result = await _createCashOrderUseCase.call(request);

      result.when(
        (success) {
          emit(state.copyWith(
            checkoutStatus: BaseStatus.success,
            checkoutEntity: success,
            errorMessage: null,
          ));
        },
        (error) {
          emit(state.copyWith(
            checkoutStatus: BaseStatus.error,
            errorMessage: error.message,
          ));
        },
      );
    } catch (error) {
      emit(state.copyWith(
        checkoutStatus: BaseStatus.error,
        errorMessage: error.toString(),
      ));
    }
  }

  void resetCheckoutState() {
    emit(CheckoutState.initial());
  }
}
