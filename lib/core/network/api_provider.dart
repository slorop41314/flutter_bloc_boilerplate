import 'package:dio/dio.dart';

abstract class ApiProvider {
  Future<Response> getAllGames();
  Future<Response> login(
    Map<String, dynamic> data,
  );
}

class ApiProviderImpl implements ApiProvider {
  final String _apiURL = "https://api.rawg.io/api";
  final String _apiKey = "207d4d3b55c14bd585269c1e32d1ea98";

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
  String _createUrl(String path) {
    return "${this._apiURL}/$path?key=${this._apiKey}";
  }

  @override
  Future<Response> getAllGames() async {
    final String finalUrl = _createUrl("games");
    return _dio.get(finalUrl);
  }

  @override
  Future<Response> login(Map<String, dynamic> data) {
    return _dio.post(
      "/login",
      data: data,
    );
  }
}
