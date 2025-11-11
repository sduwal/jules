import 'package:bloc/bloc.dart';
import 'package:splitr/features/authentication/bloc/authentication_event.dart';
import 'package:splitr/features/authentication/bloc/authentication_state.dart';
import 'package:splitr/features/authentication/data/authentication_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(AuthenticationInitial()) {
    on<AuthenticationAppStarted>(_onAppStarted);
    on<AuthenticationLoggedIn>(_onLoggedIn);
    on<AuthenticationLoggedOut>(_onLoggedOut);
  }

  Future<void> _onAppStarted(
    AuthenticationAppStarted event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final user = await _authenticationRepository.user;
      if (user != null) {
        emit(AuthenticationAuthenticated(user: user));
      } else {
        emit(AuthenticationUnauthenticated());
      }
    } catch (e) {
      emit(AuthenticationFailure(message: e.toString()));
    }
  }

  void _onLoggedIn(
    AuthenticationLoggedIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    final user = await _authenticationRepository.user;
    if (user != null) {
      emit(AuthenticationAuthenticated(user: user));
    } else {
      emit(AuthenticationFailure(message: 'Failed to get user'));
    }
  }

  void _onLoggedOut(
    AuthenticationLoggedOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _authenticationRepository.signOut();
    emit(AuthenticationUnauthenticated());
  }
}
