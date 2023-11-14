part of 'signin_bloc.dart';

@immutable
sealed class SignupEvent {}

class SignupInitialEvent extends SignupEvent{}

class SignupOnLoadEvent extends SignupEvent{

}
class SignupOnSubmitEvent extends SignupEvent{
  final String name;
  final String email;
  final String password ;

  SignupOnSubmitEvent({required this.email, required this.password,required this.name});

}

final class SignupLoginNavigateEvent extends SignupEvent{}