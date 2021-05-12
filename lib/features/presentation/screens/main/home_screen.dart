import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flu_bloc_boilerplate/features/presentation/bloc/all_games/all_games_event.dart';
import 'package:flu_bloc_boilerplate/features/presentation/bloc/all_games/all_games_state.dart';
import 'package:flu_bloc_boilerplate/features/presentation/bloc/all_games/bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllGamesBloc>(context)
      ..add(
        FetchAllGamesEvent(
          page: 1,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Example"),
      ),
      body: SafeArea(
        child: Container(
          child: BlocBuilder<AllGamesBloc, AllGamesState>(
            builder: (_, state) {
              if (state is AllGamesLoadedState) {
                return SizedBox();
              } else if (state is AllGamesInitialState) {
                return CircularProgressIndicator.adaptive();
              } else if (state is AllGamesLoadingState) {
                return Text("Loading");
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
