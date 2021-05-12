import 'package:flu_bloc_boilerplate/features/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flu_bloc_boilerplate/features/presentation/bloc/authentication/authentication_event.dart';
import 'package:flu_bloc_boilerplate/features/presentation/bloc/authentication/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late AuthRepository repository;
  AuthenticationBloc({
    required this.repository,
  }) : super(
          AuthenticationInitialState(),
        );

  AuthenticationState get initialState => AuthenticationInitialState();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is CheckSessionEvent) {
      final sessionData = this.repository.checkIsLoggedIn();
      if (sessionData != null) {
        yield AuthenticatedState(username: "Checked in");
      } else {
        yield UnauthenticatedState();
      }
    } else if (event is UserAuthenticatedEvent) {
      yield AuthenticatedState(username: "");
    } else if (event is UserUnauthenticatedEvent) {
      yield UnauthenticatedState();
    }
  }
}
