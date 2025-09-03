import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/address_response_entity.dart';

final class AddressState extends Equatable {
  // Address State
  final BaseStatus addressStatus;
  final AddressResponseEntity? addressResponseEntity;
  final String addressErrorMessage;
  
  // Add Address State
  final BaseStatus addAddressStatus;
  final String addAddressErrorMessage;
  // Delete Address State
  final BaseStatus deleteAddressStatus;
  final String deleteAddressErrorMessage;

  // Flag to indicate a new address was just added

  const AddressState({
    // Address
    required this.addressStatus,
    this.addressResponseEntity,
    this.addressErrorMessage = ConstantManager.emptyText,
    // Add Address
    required this.addAddressStatus,
    this.addAddressErrorMessage = ConstantManager.emptyText,
    //Delete Address
    required this.deleteAddressStatus,
    this.deleteAddressErrorMessage = ConstantManager.emptyText,
    // New address flag
  });
  factory AddressState.initial() {
    return const AddressState(
      addressStatus: BaseStatus.initial,
      addressResponseEntity: null,
      addAddressStatus: BaseStatus.initial,
      deleteAddressStatus: BaseStatus.initial,
    );
  }
  AddressState copyWith({
    BaseStatus? addressStatus,
    AddressResponseEntity? addressResponseEntity,
    String? addressErrorMessage,
    BaseStatus? addAddressStatus,
    String? addAddressErrorMessage,
    BaseStatus? deleteAddressStatus,
    String? deleteAddressErrorMessage,
    bool? isUpdating,
  }) {
    return AddressState(
      addressStatus: addressStatus ?? this.addressStatus,
      addressResponseEntity:
          addressResponseEntity ?? this.addressResponseEntity,
      addressErrorMessage: addressErrorMessage ?? this.addressErrorMessage,
      addAddressStatus: addAddressStatus ?? this.addAddressStatus,
      addAddressErrorMessage: addAddressErrorMessage ?? this.addAddressErrorMessage,
      deleteAddressStatus: deleteAddressStatus ?? this.deleteAddressStatus,
      deleteAddressErrorMessage: deleteAddressErrorMessage ?? this.deleteAddressErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
    addressStatus,
    addressResponseEntity,
    addressErrorMessage,
    addAddressStatus,
    addAddressErrorMessage,
    deleteAddressStatus,
    deleteAddressErrorMessage,
  ];
}
