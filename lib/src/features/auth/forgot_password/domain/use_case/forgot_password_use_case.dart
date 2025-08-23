import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/standard/use_case.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/forgot_password_request.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/entities/forgot_password_entity.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/repo/forgot_password_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class ForgotPasswordUseCase
    implements UseCase<ForgotPasswordEntity, ForgotPasswordRequest> {
  final ForgotPasswordRepository forgotPasswordRepo;

  ForgotPasswordUseCase(this.forgotPasswordRepo);

  @override
  Future<Result<ForgotPasswordEntity, Failure>> call(
    ForgotPasswordRequest param,
  ) async {
    return await forgotPasswordRepo.forgotPassword(param);
  }
}
