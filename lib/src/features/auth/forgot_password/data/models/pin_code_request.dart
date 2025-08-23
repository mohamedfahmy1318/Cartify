class ResetCodeRequest {
  final String resetCode;

  ResetCodeRequest({required this.resetCode});

  Map<String, dynamic> toJson() {
    return {'resetCode': resetCode};
  }
}
