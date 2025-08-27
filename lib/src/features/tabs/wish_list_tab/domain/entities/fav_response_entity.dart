import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/fav_entity.dart';

class FavResponseEntity extends Equatable {
  final String? status;
  final int? count;
  final List<FavEntity>? data;

  const FavResponseEntity({this.status, this.count, this.data});

  @override
  List<Object?> get props => [status, count, data];
}
