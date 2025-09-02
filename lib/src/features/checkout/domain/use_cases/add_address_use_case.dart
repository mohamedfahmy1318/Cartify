import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/address_request.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/address_response_entity.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/repo/address_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class AddAddressUseCase {
  final AddressRepository _repository;

  AddAddressUseCase(this._repository);

  Future<Result<AddressResponseEntity, Failure>> call(AddressRequest address) {
    return _repository.addAddress(address);
  }
}
