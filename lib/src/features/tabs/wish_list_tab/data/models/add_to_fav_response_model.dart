import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/add_to_fav_response_entity.dart';

class AddToFavResponseModel extends AddToFavResponseEntity {
  const AddToFavResponseModel({super.status, super.message, super.data});

  factory AddToFavResponseModel.fromJson(Map<String, dynamic> json) {
    return AddToFavResponseModel(
      status: json['status'] as String? ?? '',
      message: json['message'] as String? ?? '',
      data: json['data'] != null
          ? List<String>.from(json['data'] as List)
          : <String>[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status ?? '',
      'message': message ?? '',
      'data': data ?? [],
    };
  }

  factory AddToFavResponseModel.fromEntity(AddToFavResponseEntity entity) {
    return AddToFavResponseModel(
      status: entity.status,
      message: entity.message,
      data: entity.data,
    );
  }

  AddToFavResponseEntity toEntity() {
    return AddToFavResponseEntity(status: status, message: message, data: data);
  }
}
