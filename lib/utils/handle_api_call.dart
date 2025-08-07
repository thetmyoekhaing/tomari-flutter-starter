import 'package:tomari_flutter_starter/application/applications.dart';

Future<Map<String, dynamic>> handleApiCall(Future<Object> apiCall) async {
  try {
    var res = await apiCall;
    if (res is Failure) {
      throw res;
    }

    return (res as Success).response;
  } catch (e) {
    rethrow;
  }
}
