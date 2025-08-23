import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/shared/models/user_model.dart';
import 'package:full_ecommerce_app/src/core/standard/use_case.dart';
import 'package:full_ecommerce_app/src/features/auth/register/data/models/register_request_model.dart';
import 'package:full_ecommerce_app/src/features/auth/register/domain/repos/register_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class RegisterUseCase
    implements UseCase<UserAuthResponse, RegisterRequestModel> {
  final RegisterRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Result<UserAuthResponse, Failure>> call(
    RegisterRequestModel params,
  ) async {
    return await _repository.register(params);
  }
}
