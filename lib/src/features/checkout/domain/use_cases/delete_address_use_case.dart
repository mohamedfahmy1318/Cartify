import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/address_response_entity.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/repo/check_out_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class DeleteAddressUseCase {
  final CheckoutRepository repository;

  DeleteAddressUseCase(this.repository);

   Future<Result<AddressResponseEntity, Failure>> deleteAddress(String addressId)  {
    return  repository.deleteAddress(addressId);
  }
}