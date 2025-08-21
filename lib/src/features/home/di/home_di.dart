
import '../../../config/res/constants_manager.dart';
import '../data/imports/data_imports.dart';
import '../domain/imports/domain_imports.dart';

void setUpHomeDependencies() {
  sl.registerLazySingleton<GetBooksUseCase>(
    () => GetBooksUseCase(
        homeRepo: sl<HomeRepository>()),
  );

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: sl<HomeRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
}
