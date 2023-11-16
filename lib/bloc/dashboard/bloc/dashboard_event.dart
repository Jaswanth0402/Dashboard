part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

final class DashboardLogoutEvent extends DashboardEvent{}

final class DashboardInsertProfileEvent extends DashboardEvent{
  final ImageSource source;

  DashboardInsertProfileEvent({required this.source});
}