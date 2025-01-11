class CustomResponse<T> {
  const CustomResponse({
    required this.data,
    required this.statusCode,
    required this.statusMessage,
  });
  final T? data;
  final int? statusCode;
  final String? statusMessage;

  bool get isSuccessRequest =>
      statusCode != null && statusCode! >= 200 && statusCode! < 300;
}
