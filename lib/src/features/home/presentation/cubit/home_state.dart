part of '../imports/presentaion_imports.dart';

final class HomeState extends Equatable {
  final BaseStatus baseStatus;
  final List<PlayerEntity> players;
  final String errorMessage;

  const HomeState({
    required this.baseStatus,
    required this.players,
    this.errorMessage = ConstantManager.emptyText,
  });

  factory HomeState.initial() {
    return const HomeState(
      baseStatus: BaseStatus.initial,
      players: [],
    );
  }

  HomeState copyWith({
    BaseStatus? baseStatus,
    List<PlayerEntity>? players,
    String? errorMessage,
  }) {
    return HomeState(
      baseStatus: baseStatus ?? this.baseStatus,
      players: players ?? this.players,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        baseStatus,
        players,
        errorMessage,
  ];
}
