part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardActionState extends DashboardState{}

final class DashboardInitialState extends DashboardState {
  
}


final class DashboardOnLoadLogoutState extends DashboardState{}

final class DashboardSuccessState extends DashboardActionState{}

final class DashboardOnLoadProfileState extends DashboardState{}

final class DashboardSuccessProfileState extends DashboardActionState{
 final String image;

  DashboardSuccessProfileState({required this.image});
}