import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/shared/models/user_model.dart';
import 'package:full_ecommerce_app/src/features/auth/register/data/models/register_request_model.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class RegisterRepository {
  Future<Result<UserAuthResponse, Failure>> register(
    RegisterRequestModel request,
  );
}
