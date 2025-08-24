import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/standard/use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/banner_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/repos/get_home_tab_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class GetBannersParams extends Equatable {
  final int? limit;
  final int? page;

  const GetBannersParams({this.limit, this.page});

  @override
  List<Object?> get props => [limit, page];
}

class GetBannersUseCase
    implements UseCase<BannerResponseEntity, GetBannersParams?> {
  final GetHomeTabRepository _repository;

  GetBannersUseCase(this._repository);

  @override
  Future<Result<BannerResponseEntity, Failure>> call(GetBannersParams? params) {
    return _repository.getBanners(limit: params?.limit, page: params?.page);
  }
}
