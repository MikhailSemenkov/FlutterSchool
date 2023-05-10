part of 'authorization_bloc.dart';

abstract class AuthorizationEvent {
  String? phoneNumber;
  String? otp;

  AuthorizationEvent({this.phoneNumber, this.otp});
}

class GetAuthorizationTokenEvent extends AuthorizationEvent {}

class GenerateAuthorizationTokenEvent extends AuthorizationEvent {
  GenerateAuthorizationTokenEvent(
      {required super.phoneNumber, required super.otp});
}
