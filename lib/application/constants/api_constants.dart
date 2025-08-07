class ApiConstants {
  factory ApiConstants() {
    return I;
  }

  ApiConstants._internal();
  static final ApiConstants I = ApiConstants._internal();

  final baseUrl = "http://localhost:port";

  final get = "GET";
  final post = "POST";
  final put = "PUT";
  final delete = "DELETE";

  static const fetchExample = "/exmaple";
}
