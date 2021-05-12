import 'package:flu_bloc_boilerplate/features/domain/entities/base/paginated_response.dart';
import 'package:flu_bloc_boilerplate/features/domain/entities/game.dart';

abstract class GamesRepository {
  Future<PaginatedResponse<List<Game>>> getAllGames();
  Future<void> getUpcomingGames();
}
