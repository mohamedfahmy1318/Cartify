part of '../imports/presentaion_imports.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.fetchPlayersUseCase) : super(HomeState.initial());
  final GetBooksUseCase fetchPlayersUseCase;

  void fetchPlayers([String? searchQuery]) async {
    final result = await fetchPlayersUseCase.call(searchQuery);
    result.when(
      (success) => emit(
        state.copyWith(
          baseStatus: BaseStatus.success,
          players: success.data,
        ),
      ),
      (error) => emit(
        state.copyWith(
          baseStatus: BaseStatus.error,
          errorMessage: error.message,
        ),
      ),
    );
  }
}
