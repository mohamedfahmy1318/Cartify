class BaseModel<T> {
  final String message;
  final T data;

  BaseModel({required this.message, required this.data});

  factory BaseModel.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic json)? jsonToModel,
  }) {
    // Check if the response has the standard BaseModel structure
    final bool hasStandardStructure =
        json.containsKey('msg') || json.containsKey('message');
    final bool hasDataKey = json.containsKey('data');

    if (hasStandardStructure && hasDataKey) {
      // Standard BaseModel structure: { "msg": "...", "data": {...} }
      return BaseModel(
        message: json['msg']?.toString() ?? json['message']?.toString() ?? '',
        data: jsonToModel != null ? jsonToModel(json['data']) : json['data'],
      );
    } else {
      // Non-standard structure (like pagination response): { "data": [...], "links": {...}, "meta": {...} }
      // Pass the full JSON to the mapper so it can handle the complete structure
      return BaseModel(
        message: json['msg']?.toString() ?? json['message']?.toString() ?? '',
        data: jsonToModel != null ? jsonToModel(json) : json as T,
      );
    }
  }
}
