import 'package:bloc/bloc.dart';
import 'package:splitr/features/dashboard/bloc/dashboard_event.dart';
import 'package:splitr/features/dashboard/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardLoad>(_onLoad);
  }

  void _onLoad(DashboardLoad event, Emitter<DashboardState> emit) {
    emit(DashboardLoading());
    // TODO: Implement data fetching from repository
    emit(const DashboardLoaded());
  }
}
