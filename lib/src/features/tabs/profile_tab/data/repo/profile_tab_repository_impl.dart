import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/data/data_sources/profile_tab_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/data/models/password_model_response.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/data/models/password_request_model.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/domain/repositories/profile_tab_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class ProfileTabRepositoryImpl implements ProfileTabRepository {
  final ProfileTabRemoteDataSource remoteDataSource;

  ProfileTabRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<PasswordUpdateResponseModel, Failure>> updatePassword(
    PasswordRequestModel request,
  ) async {
    try {
      final response = await remoteDataSource.updatePassword(request);
      return Result.success(response);
    } catch (error) {
      if (error is Failure) {
        return Result.error(error);
      }
      return Result.error(Failure(error.toString()));
    }
  }
}
