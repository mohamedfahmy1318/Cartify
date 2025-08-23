import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/extensions/error_handler_extension.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/data_soursces/forgot_password_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/forgot_password_request.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/pin_code_request.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/entities/pin_code_entity.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/repo/forgot_password_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordRemoteDataSource remoteDataSource;

  ForgotPasswordRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<ForgotPasswordEntity, Failure>> forgotPassword(
    ForgotPasswordRequest request,
  ) async {
    return await remoteDataSource
        .forgotPassword(request)
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<PinCodeEntity, Failure>> resetCode(
    ResetCodeRequest request,
  ) async {
    return await remoteDataSource.pinCode(request).handleCallbackWithFailure();
  }
}
