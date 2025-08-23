import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/extensions/error_handler_extension.dart';
import 'package:full_ecommerce_app/src/core/shared/models/user_model.dart';
import 'package:full_ecommerce_app/src/features/auth/register/data/data_sources/register_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/auth/register/data/models/register_request_model.dart';
import 'package:full_ecommerce_app/src/features/auth/register/domain/repos/register_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource _remoteDataSource;

  RegisterRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<UserAuthResponse, Failure>> register(
    RegisterRequestModel request,
  ) {
    return _remoteDataSource.register(request).handleCallbackWithFailure();
  }
}
