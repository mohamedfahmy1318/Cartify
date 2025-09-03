import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/address_request.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/use_cases/add_address_use_case.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/use_cases/delete_address_use_case.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/use_cases/get_all_address._use_case.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(
    this.getAllAddressUseCase,
    this.addAddressUseCase,
    this.deleteAddressUseCase,
  ) : super(AddressState.initial());

  final GetAllAddressUseCase getAllAddressUseCase;
  final AddAddressUseCase addAddressUseCase;
  final DeleteAddressUseCase deleteAddressUseCase;
  // GET ADDRESS METHODS
  void fetchAllAddress() async {
    emit(state.copyWith(addressStatus: BaseStatus.loading));
    final result = await getAllAddressUseCase.call();
    result.when(
      (success) => emit(
        state.copyWith(
          addressStatus: BaseStatus.success,
          addressResponseEntity: success,
          // Preserve the addAddressStatus
        ),
      ),
      (error) => emit(
        state.copyWith(
          addressStatus: BaseStatus.error,
          addressErrorMessage: error.message,
          // Preserve the addAddressStatus
        ),
      ),
    );
  }

  // ADD ADDRESS METHOD
  void addAddress(AddressRequest address) async {
    emit(state.copyWith(addAddressStatus: BaseStatus.loading));

    try {
      final result = await addAddressUseCase.call(address);

      result.when(
        (success) {
          // Emit success for add operation
          emit(state.copyWith(addAddressStatus: BaseStatus.success));
        },
        (error) {
          emit(
            state.copyWith(
              addAddressStatus: BaseStatus.error,
              addAddressErrorMessage: error.message,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          addAddressStatus: BaseStatus.error,
          addAddressErrorMessage: 'Unexpected error: $e',
        ),
      );
    }
  }
  //Delete Address 
  Future<void> deleteAddress(String addressId) async {
    try {
      emit(state.copyWith(deleteAddressStatus: BaseStatus.loading));
      
      final result = await deleteAddressUseCase.deleteAddress(addressId);
      
      result.when(
        (success) {
          emit(state.copyWith(
            deleteAddressStatus: BaseStatus.success,
            deleteAddressErrorMessage: null,
          ));
          // Refresh the list after successful deletion
          fetchAllAddress();
        },
        (error) {
          emit(state.copyWith(
            deleteAddressStatus: BaseStatus.error,
            deleteAddressErrorMessage: error.message,
          ));
        },
      );
      
    } catch (error) {
      emit(state.copyWith(
        deleteAddressStatus: BaseStatus.error,
        deleteAddressErrorMessage: error.toString(),
      ));
    }
  }

  // RESET ADD ADDRESS STATE
  void resetAddAddressState() {
    emit(state.copyWith(addAddressStatus: BaseStatus.initial));
  }

  // RESET DELETE ADDRESS STATE
  void resetDeleteAddressState() {
    emit(state.copyWith(deleteAddressStatus: BaseStatus.initial));
  }


}
