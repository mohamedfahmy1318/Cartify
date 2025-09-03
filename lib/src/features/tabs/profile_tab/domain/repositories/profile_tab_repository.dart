import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/data/models/password_model_response.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/data/models/password_request_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ProfileTabRepository {
  Future<Result<PasswordUpdateResponseModel, Failure>> updatePassword(
    PasswordRequestModel request,
  );
}
