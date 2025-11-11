import 'package:bloc/bloc.dart';
import 'package:splitr/core/data/user_repository.dart';
import 'package:splitr/features/authentication/data/authentication_repository.dart';
import 'package:splitr/features/settings/bloc/settings_event.dart';
import 'package:splitr/features/settings/bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final UserRepository _userRepository;
  final AuthenticationRepository _authenticationRepository;

  SettingsBloc({
    required UserRepository userRepository,
    required AuthenticationRepository authenticationRepository,
  })  : _userRepository = userRepository,
        _authenticationRepository = authenticationRepository,
        super(SettingsInitial()) {
    on<SettingsLoadUser>(_onLoadUser);
    on<SettingsLogout>(_onLogout);
  }

  Future<void> _onLoadUser(
    SettingsLoadUser event,
    Emitter<SettingsState> emit,
  ) async {
    emit(SettingsLoading());
    try {
      final user = await _authenticationRepository.user;
      if (user != null) {
        final userModel = await _userRepository.getUser(userId: user.uid);
        emit(SettingsLoaded(user: userModel));
      } else {
        emit(const SettingsFailure(message: 'User not found'));
      }
    } catch (e) {
      emit(SettingsFailure(message: e.toString()));
    }
  }

  Future<void> _onLogout(
    SettingsLogout event,
    Emitter<SettingsState> emit,
  ) async {
    await _authenticationRepository.signOut();
  }
}
