part of 'authorization_bloc.dart';

abstract class AuthorizationEvent {}

class GetAuthorizationEvent extends AuthorizationEvent {}

class UserPermittedAuthorizationEvent extends AuthorizationEvent {
  String authorizationRequest;
  UserPermittedAuthorizationEvent({required this.authorizationRequest});
}

class RefreshAuthorizationEvent extends AuthorizationEvent {}
