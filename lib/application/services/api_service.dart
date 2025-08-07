import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:tomari_flutter_starter/application/applications.dart';
import 'package:tomari_flutter_starter/utils/logger.dart';

enum ApiStatus { initial, loading, complete, failed }

class ApiService {
  late final Dio _dio;
  late final Logger _logger;

  /// Retrieves the singleton instance of `ApiService`.
  static final ApiService I = ApiService._();

  factory ApiService() {
    return I;
  }

  /// making dio to construct one instance when calling api service.
  ApiService._() {
    _logger = Logger();
    _dio = Dio();
  }

  String? _token;

  /// Sets the authorization token for API requests.
  set setToken(String token) {
    _token = token;
  }

  /// Makes a request to the API.
  ///
  /// `sendData` is the data to send to the API.
  ///
  /// `baseUrl` overrides the default base URL if provided.
  ///
  /// `path` is the endpoint path after the base URL.
  ///
  /// `queryParameters` are optional query parameters for the request.
  ///
  /// `isAlreadyHaveToken` indicates whether to use the token set via [setToken].
  ///
  /// `token` allows setting the token manually.
  ///
  /// Throws an error if [sendData] is empty.
  Future<Object> _callApi({
    Map<String, dynamic>? sendData,
    String? baseUrl,
    String? path,
    bool isAlreadyHaveToken = true,
    Map<String, dynamic>? queryParameters,
    String? token,
    String apiMethod = "GET",
  }) async {
    if (apiMethod != ApiConstants.I.get && sendData == null) {
      throw ArgumentError("Send data cannot be empty");
    }

    final base = baseUrl ?? ApiConstants.I.baseUrl;

    _logger.d(
      "Calling API => Base URL: $base, Path: ${path ?? ''}, Query Parameters: $queryParameters",
    );

    try {
      final res = await _dio.fetch<Map<String, dynamic>>(
        RequestOptions(
          baseUrl: base,
          path: path ?? "",
          method: apiMethod,
          data: apiMethod != ApiConstants.I.get ? sendData : null,
          queryParameters: queryParameters,
          headers: _buildHeader(isAlreadyHaveToken, token),
        ),
      );

      _logger.i("API Response => Data: ${res.data}");

      return _handleResponse(res);
    } catch (e, s) {
      return _handleError(e, s);
    }
  }

  Future<Object> get(String path, {Map<String, dynamic>? queryParameters}) {
    return _callApi(
      path: path,
      apiMethod: ApiConstants.I.get,
      queryParameters: queryParameters,
    );
  }

  Future<Object> post(String path, {required Map<String, dynamic> sendData}) {
    return _callApi(
      path: path,
      apiMethod: ApiConstants.I.post,
      sendData: sendData,
    );
  }

  Future<Object> put(String path, {required Map<String, dynamic> sendData}) {
    return _callApi(
      path: path,
      apiMethod: ApiConstants.I.put,
      sendData: sendData,
    );
  }

  Map<String, dynamic>? _buildHeader(bool isAlreadyHaveToken, String? token) {
    return isAlreadyHaveToken || token != null
        ? {'Authorization': "Bearer ${token ?? _token}"}
        : null;
  }

  Future<Object> _handleResponse(
    Response res, {
    bool isFetchingCookie = false,
  }) async {
    if (res.statusCode == HttpStatus.ok ||
        res.statusCode == HttpStatus.notModified) {
      logger("isFetchingCookie $isFetchingCookie");

      return Success(response: res.data!);
    }

    throw Failure(message: res.data!.toString(), title: "Error Fetching Api");
  }

  Object _handleError(dynamic e, StackTrace s) {
    if (e is DioException) {
      logger('DioError: ${e.message}');
      logger('DioError response: ${e.response}');
      logger('DioError type: ${e.type}');
      throw Failure(title: "$e", message: s.toString());
    } else if (e is SocketException) {
      throw const Failure(
        title: "Network Error",
        message: "something went wrong with the connection. please try again.",
      );
    } else {
      throw Failure(title: "Unknown error $e", message: s.toString());
    }
  }

  /// for downloading files and photos from http
  Future<String?> download({
    required String httpUrlPath,
    required String savePath,
  }) async {
    try {
      final res = await _dio.download(httpUrlPath, savePath);

      if (res.statusCode == HttpStatus.ok) {
        _logger.i("Download successfully");

        return httpUrlPath;
      }
    } catch (e) {
      _logger.e("Error downloading => $e");
    }
    return null;
  }
}

class Success {
  final Map<String, dynamic> response;
  const Success({required this.response});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'response': response};
  }

  factory Success.fromMap(Map<String, dynamic> map) {
    return Success(response: map['response'] as dynamic);
  }

  String toJson() => json.encode(toMap());

  factory Success.fromJson(String source) =>
      Success.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return "Success($response)";
  }
}

class Failure implements Exception {
  final String title;
  final String message;
  const Failure({required this.title, required this.message});

  @override
  bool operator ==(covariant Failure other) {
    if (identical(this, other)) return true;

    return other.title == title && other.message == message;
  }

  @override
  int get hashCode => title.hashCode ^ message.hashCode;

  @override
  String toString() {
    return "title: $title \n message $message";
  }
}
