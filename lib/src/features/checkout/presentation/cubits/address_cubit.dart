import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/address_request.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/use_cases/add_address_use_case.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/use_cases/get_all_address._use_case.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(
    this.getAllAddressUseCase,
    this.addAddressUseCase,
  ) : super(AddressState.initial());

  final GetAllAddressUseCase getAllAddressUseCase;
  final AddAddressUseCase addAddressUseCase;

  // GET ADDRESS METHODS
  void fetchAllAddress() async {
    emit(state.copyWith(addressStatus: BaseStatus.loading));
    final result = await getAllAddressUseCase.call();
    result.when(
      (success) => emit(
        state.copyWith(
          addressStatus: BaseStatus.success,
          addressResponseEntity: success,
        ),
      ),
      (error) => emit(
        state.copyWith(
          addressStatus: BaseStatus.error,
          addressErrorMessage: error.message,
        ),
      ),
    );
  }

  // ADD ADDRESS METHOD
  void addAddress(AddressRequest address) async {
    emit(state.copyWith(addressStatus: BaseStatus.loading));
    final result = await addAddressUseCase.call(address);
    result.when(
      (success) {
        // Emit success for the add operation
        emit(state.copyWith(
          addressStatus: BaseStatus.success,
          addressResponseEntity: success,
        ));

        // Automatically refresh the address list after a short delay
        Future.delayed(const Duration(milliseconds: 300), () {
          fetchAllAddress();
        });
      },
      (error) => emit(
        state.copyWith(
          addressStatus: BaseStatus.error,
          addressErrorMessage: error.message,
        ),
      ),
    );
  }
}
