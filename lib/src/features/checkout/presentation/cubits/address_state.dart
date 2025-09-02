import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/address_response_entity.dart';

final class AddressState extends Equatable {
  // Address State
  final BaseStatus addressStatus;
  final AddressResponseEntity? addressResponseEntity;
  final String addressErrorMessage;
  final bool isUpdating;

  const AddressState({
    // Address
    required this.addressStatus,
    this.addressResponseEntity,
    this.addressErrorMessage = ConstantManager.emptyText,
    this.isUpdating = false,
  });
  factory AddressState.initial() {
    return const AddressState(
      addressStatus: BaseStatus.initial,
      addressResponseEntity: null,
    );
  }
  AddressState copyWith({
    BaseStatus? addressStatus,
    AddressResponseEntity? addressResponseEntity,
    String? addressErrorMessage,
    bool? isUpdating,
  }) {
    return AddressState(
      addressStatus: addressStatus ?? this.addressStatus,
      addressResponseEntity:
          addressResponseEntity ?? this.addressResponseEntity,
      addressErrorMessage: addressErrorMessage ?? this.addressErrorMessage,
      isUpdating: isUpdating ?? this.isUpdating,
    );
  }

  @override
  List<Object?> get props => [
    addressStatus,
    addressResponseEntity,
    addressErrorMessage,
    isUpdating,
  ];
}
