import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/extensions/error_handler_extension.dart';
import 'package:full_ecommerce_app/src/core/shared/models/user_model.dart';
import 'package:full_ecommerce_app/src/features/auth/login/data/data_sources/login_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/auth/login/data/models/login_request_model.dart';
import 'package:full_ecommerce_app/src/features/auth/login/domain/repos/login_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _remoteDataSource;

  LoginRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<UserAuthResponse, Failure>> login(LoginRequestModel request) {
    return _remoteDataSource.login(request).handleCallbackWithFailure();
  }
}
