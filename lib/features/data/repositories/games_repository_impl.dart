import 'package:flu_bloc_boilerplate/core/network/api_provider.dart';
import 'package:flu_bloc_boilerplate/features/data/datasources/games/games_local_data_source.dart';
import 'package:flu_bloc_boilerplate/features/data/datasources/games/games_remote_data_source.dart';
import 'package:flu_bloc_boilerplate/features/domain/entities/base/paginated_response.dart';
import 'package:flu_bloc_boilerplate/features/domain/entities/game.dart';
import 'package:flu_bloc_boilerplate/features/domain/repositories/games_repository.dart';
import 'package:flutter/material.dart';

class GamesRepositoryImpl implements GamesRepository {
  final GamesRemoteDataSource remoteDataSource;
  final GamesLocalDataSource localDataSource;
  // final ApiProvider apiProvider;

  GamesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    // required this.apiProvider,
  });

  @override
  Future<PaginatedResponse<List<Game>>> getAllGames() async {
    try {
      final response = await this.remoteDataSource.getAllGames();
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> getUpcomingGames() async {
    // TODO: implement getUpcomingGames
    throw UnimplementedError();
  }
}
