import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/extensions/error_handler_extension.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/data_sourcse/address_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/address_request.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/address_response_entity.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/repo/address_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDataSource _remoteDataSource;

  AddressRepositoryImpl(this._remoteDataSource);

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
}
