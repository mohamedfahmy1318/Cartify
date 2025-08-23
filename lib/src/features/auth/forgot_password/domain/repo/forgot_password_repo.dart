import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/forgot_password_request.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/pin_code_request.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/entities/pin_code_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ForgotPasswordRepository {
  Future<Result<ForgotPasswordEntity, Failure>> forgotPassword(
    ForgotPasswordRequest request,
  );
  Future<Result<PinCodeEntity, Failure>> resetCode(ResetCodeRequest request);
}
