import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/shared/models/user_model.dart';
import 'package:full_ecommerce_app/src/core/standard/use_case.dart';
import 'package:full_ecommerce_app/src/features/auth/login/data/models/login_request_model.dart';
import 'package:full_ecommerce_app/src/features/auth/login/domain/repos/login_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class LoginUseCase implements UseCase<UserAuthResponse, LoginRequestModel> {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Result<UserAuthResponse, Failure>> call(
    LoginRequestModel params,
  ) async {
    return await _repository.login(params);
  }
}
