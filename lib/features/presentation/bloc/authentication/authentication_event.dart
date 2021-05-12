import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const <dynamic>[]]) : super();
}

class UserAuthenticatedEvent extends AuthenticationEvent {
  final String username;

  UserAuthenticatedEvent({required this.username});

  @override
  List<Object> get props => [];
}

class UserUnauthenticatedEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class CheckSessionEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
