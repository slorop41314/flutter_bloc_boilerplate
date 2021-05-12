import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Example"),
      ),
      body: SafeArea(
        child: Container(
          child: SizedBox(),

          // BlocBuilder<AllGamesBloc, AllGamesState>(
          //   builder: (_, state) {
          //     if (state is AllGamesLoadedState) {
          //       return SizedBox();
          //     } else if (state is AllGamesInitialState) {
          //       return CircularProgressIndicator.adaptive();
          //     } else if (state is AllGamesLoadingState) {
          //       return Text("Loading");
          //     }
          //     return SizedBox();
          //   },
          // ),
        ),
      ),
    );
  }
}
