part of 'signin_bloc.dart';

@immutable
sealed class SignupState {}

class SignupActionState extends SignupState{}

final class SignupInitial extends SignupState {}

class SignupOnLoadState extends SignupState{}
class SignupSuccessState extends SignupActionState{
}

class SignupErrorState extends SignupActionState{
  final String message;

  SignupErrorState({required this.message});

}


