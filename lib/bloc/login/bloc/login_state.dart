part of 'login_bloc.dart';


abstract class LoginState {}

abstract class LoginActionState extends LoginState{}
final class LoginInitialState extends LoginState {}

final class LoginOnLoadState extends LoginState{}

final class LoginOnLoadLogoutState extends LoginState{}

final class LoginSuccessState extends LoginActionState{
  final String message;
  final String? email;
  LoginSuccessState( {required this.message, required this.email});
 }
final class LoginErrorState extends LoginActionState{
  final String message;

  LoginErrorState({required this.message});

}

final class LoginSignupNavigateState extends LoginActionState{}
