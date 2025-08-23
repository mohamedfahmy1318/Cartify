import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/standard/use_case.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/pin_code_request.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/entities/pin_code_entity.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/repo/forgot_password_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class ResetCodeUseCase implements UseCase<PinCodeEntity, ResetCodeRequest> {
  final ForgotPasswordRepository forgotPasswordRepo;

  ResetCodeUseCase(this.forgotPasswordRepo);

  @override
  Future<Result<PinCodeEntity, Failure>> call(ResetCodeRequest param) async {
    return await forgotPasswordRepo.resetCode(param);
  }
}
