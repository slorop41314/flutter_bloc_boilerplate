import 'package:dio/dio.dart';

import '../../../../core/network/api_provider.dart';
import '../../../domain/entities/base/paginated_response.dart';
import '../../../domain/entities/game.dart';

abstract class GamesRemoteDataSource {
  Future<PaginatedResponse<List<Game>>> getAllGames();
}

class GamesRemoteDataSourceImpl implements GamesRemoteDataSource {
  late ApiProvider apiProvider;

  GamesRemoteDataSourceImpl({
    required this.apiProvider,
  });

  @override
  Future<PaginatedResponse<List<Game>>> getAllGames() async {
    try {
      final response = await apiProvider.getAllGames();
      final PaginatedResponse<List<Game>> gamesData =
          PaginatedResponse.fromJson(
        response.data,
        (json) => (json as List).map((element) {
          return Game.fromJson(element);
        }).toList(),
      );
      return gamesData;
    } on DioError catch (e) {
      print(e.response?.data);
      return Future.error(e);
    }
  }
}
