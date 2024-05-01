class ValidResponse{
  final int? statusCode;
  final dynamic body;
  final String? message;

  ValidResponse({this.message, this.statusCode, this.body});
}