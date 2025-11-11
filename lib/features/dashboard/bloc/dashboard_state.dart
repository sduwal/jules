import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  // Add dashboard data here
  const DashboardLoaded();
}

class DashboardFailure extends DashboardState {
  final String message;

  const DashboardFailure({required this.message});

  @override
  List<Object> get props => [message];
}
