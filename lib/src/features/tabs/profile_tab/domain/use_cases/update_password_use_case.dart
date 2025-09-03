import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/standard/use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/data/models/password_model_response.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/data/models/password_request_model.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/domain/repositories/profile_tab_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class UpdatePasswordUseCase extends UseCase<PasswordUpdateResponseModel, PasswordRequestModel> {
  final ProfileTabRepository repository;

  UpdatePasswordUseCase( this.repository);

  @override
  Future<Result<PasswordUpdateResponseModel, Failure>> call(PasswordRequestModel params) async {
    return await repository.updatePassword(params);
  }
}
