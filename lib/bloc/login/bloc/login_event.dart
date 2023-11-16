part of 'login_bloc.dart';


@immutable
sealed class LoginEvent {}

final class LoginInitialEvent extends LoginEvent{}

final class LoginOnLoadEvent extends LoginEvent{

}
final class LoginOnSubmitEvent extends LoginEvent{
  final String email;
  final String password ;
  

  LoginOnSubmitEvent({required this.email, required this.password});

}
final class LoginSignupNavigateEvent extends LoginEvent{}