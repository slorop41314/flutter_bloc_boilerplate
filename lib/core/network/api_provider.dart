import 'package:dio/dio.dart';

abstract class ApiProvider {
  Future<Response> login(
    Map<String, dynamic> data,
  );
}

class ApiProviderImpl implements ApiProvider {
  final Dio _dio = Dio();
  String accessToken = "";
  static BaseOptions options = BaseOptions(
    baseUrl: "",
    contentType: "application/json",
    followRedirects: false,
    responseType: ResponseType.plain,
    connectTimeout: 30000,
    receiveTimeout: 30000,
    validateStatus: (status) {
      return status! < 500;
    },
  );

  @override
  Future<Response> login(Map<String, dynamic> data) {
    return _dio.post(
      "/login",
      data: data,
    );
  }
}
