import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final auth.User user;

  const AuthenticationAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  const AuthenticationFailure({required this.message});

  @override
  List<Object> get props => [message];
}
