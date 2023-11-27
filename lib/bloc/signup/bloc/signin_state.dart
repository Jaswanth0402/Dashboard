part of 'signin_bloc.dart';

@immutable
sealed class SignupState {}

class SignupActionState extends SignupState{}

final class SignupInitial extends SignupState {}

class SignupOnLoadState extends SignupState{
   final String image;
   SignupOnLoadState({required this.image});
}
class SignupSuccessState extends SignupActionState{
}

class SignupErrorState extends SignupActionState{
  final String message;

  SignupErrorState({required this.message});

}
final class InsertProfileSuccessState extends SignupState{
 final String image;

  InsertProfileSuccessState({required this.image});
}

