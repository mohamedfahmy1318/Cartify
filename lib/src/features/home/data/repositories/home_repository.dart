part of '../imports/data_imports.dart';

abstract class HomeRepository {
  Future<Result<BaseModel<List<PlayerEntity>>, Failure>> fetchPlayers(
      [String? searchQuery]);
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Result<BaseModel<List<PlayerEntity>>, Failure>> fetchPlayers(
      [String? searchQuery]) async {
    return await remoteDataSource
        .fetchPlayers(searchQuery)
        .handleCallbackWithFailure();
  }
}
