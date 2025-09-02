import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/address_request.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/address_response_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class AddressRepository {
  Future<Result<AddressResponseEntity, Failure>> getAllAddress();
  Future<Result<AddressResponseEntity, Failure>> addAddress(AddressRequest address);
  //Future<Result<AddressResponseEntity, Failure>> updateAddress(AddressModel address);
  //Future<Result<AddressResponseEntity, Failure>> removeAddress(String id);
}
