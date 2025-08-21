part of '../imports/domain_imports.dart';

class GetBooksUseCase
    implements UseCase<BaseModel<List<PlayerEntity>>, String> {
  final HomeRepository homeRepo;
  GetBooksUseCase({required this.homeRepo});

  @override
  Future<Result<BaseModel<List<PlayerEntity>>, Failure>> call(
      [String? param]) async {
    return await homeRepo.fetchPlayers(param);
  }
}
