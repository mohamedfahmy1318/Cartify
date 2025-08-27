import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/fav_entity.dart';

final class FavoritesState extends Equatable {
  final BaseStatus favoritesStatus;
  final List<FavEntity> favEntity;
  final String favoriteProductErrorMessage;

  const FavoritesState({
    required this.favoritesStatus,
    required this.favEntity,
    this.favoriteProductErrorMessage = ConstantManager.emptyText,
  });

  factory FavoritesState.initial() {
    return const FavoritesState(
      favoritesStatus: BaseStatus.initial,
      favEntity: [],
    );
  }

  FavoritesState copyWith({
    BaseStatus? favoritesStatus,
    List<FavEntity>? favEntity,
    String? favoriteProductErrorMessage,
  }) {
    return FavoritesState(
      favoritesStatus: favoritesStatus ?? this.favoritesStatus,
      favEntity: favEntity ?? this.favEntity,
      favoriteProductErrorMessage:
          favoriteProductErrorMessage ?? this.favoriteProductErrorMessage,
    );
  }

  @override
  List<Object> get props => [
    favoritesStatus,
    favEntity,
    favoriteProductErrorMessage,
  ];
}
