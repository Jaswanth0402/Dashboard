part of 'login_bloc.dart';


abstract class LoginState {}

abstract class LoginActionState extends LoginState{}
final class LoginInitialState extends LoginState {}

final class LoginOnLoadState extends LoginState{}

final class LoginOnLoadLogoutState extends LoginState{}


final class LoginSuccessState extends LoginActionState{
  
  
}

final class LoginSignupNavigateState extends LoginActionState{}
