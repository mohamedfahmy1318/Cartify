import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/fav_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/data/models/fav_model.dart';

class FavResponseModel extends FavResponseEntity {
  const FavResponseModel({super.status, super.count, super.data});

  factory FavResponseModel.fromJson(Map<String, dynamic> json) {
    return FavResponseModel(
      status: json['status'] as String? ?? '',
      count: json['count'] as int? ?? 0,
      data: json['data'] != null
          ? (json['data'] as List)
                .map((item) => FavModel.fromJson(item as Map<String, dynamic>))
                .toList()
          : <FavModel>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status ?? '',
      'count': count ?? 0,
      'data': data?.map((item) => (item as FavModel).toJson()).toList() ?? [],
    };
  }

  factory FavResponseModel.fromEntity(FavResponseEntity entity) {
    return FavResponseModel(
      status: entity.status,
      count: entity.count,
      data: entity.data?.map((item) => FavModel.fromEntity(item)).toList(),
    );
  }

  FavResponseEntity toEntity() {
    return FavResponseEntity(
      status: status,
      count: count,
      data: data?.map((item) => (item as FavModel).toEntity()).toList(),
    );
  }
}
