import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/extensions/error_handler_extension.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/data_sourcse/check_out_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/address_request.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/checkout_request_model.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/checkout_response_model.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/address_response_entity.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/checkout_entity.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/repo/check_out_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutRemoteDataSource _remoteDataSource;

  CheckoutRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<AddressResponseEntity, Failure>> getAllAddress() {
    return _remoteDataSource
        .getAllAddress()
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<AddressResponseEntity, Failure>> addAddress(
    AddressRequest address,
  ) {
    return _remoteDataSource
        .addAddress(address)
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }
  
  @override
  Future<Result<AddressResponseEntity, Failure>> deleteAddress(String addressId) {
    return _remoteDataSource
        .deleteAddress(addressId)
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<CheckoutEntity, Failure>> createCashOrder(CheckoutRequestModel request) {
    return _remoteDataSource
        .createCashOrder(request)
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }
}
