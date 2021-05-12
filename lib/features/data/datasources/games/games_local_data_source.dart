import '../../../domain/entities/base/paginated_response.dart';
import '../../../domain/entities/game.dart';

abstract class GamesLocalDataSource {
  Future<PaginatedResponse<List<Game>>> getAllGames();
}

class GamesLocalDataSourceImpl implements GamesLocalDataSource {
  @override
  Future<PaginatedResponse<List<Game>>> getAllGames() async {
    return Future.error('');
  }
}
