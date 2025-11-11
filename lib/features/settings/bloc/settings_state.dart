import 'package:equatable/equatable.dart';
import 'package:splitr/core/models/user_model.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final UserModel user;

  const SettingsLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class SettingsFailure extends SettingsState {
  final String message;

  const SettingsFailure({required this.message});

  @override
  List<Object> get props => [message];
}
