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
  final String image;
  final String contact;
  SignupOnSubmitEvent( {required this.email, required this.password,required this.name,required this.image,required this.contact});

}
final class InsertProfileEvent extends SignupEvent{
  final ImageSource source;

  InsertProfileEvent({required this.source});
}

final class SignupLoginNavigateEvent extends SignupEvent{}