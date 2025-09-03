import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/checkout_request_model.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/checkout_entity.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/repo/check_out_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class CreateCashOrderUseCase {
  final CheckoutRepository repository;

  CreateCashOrderUseCase(this.repository);

  Future<Result<CheckoutEntity, Failure>> call(CheckoutRequestModel request) {
    return repository.createCashOrder(request);
  }
}
