part of 'authorization_bloc.dart';

@immutable
abstract class AuthorizationState {
  final APIToken? token;

  const AuthorizationState([this.token]);
}

class AuthorizationInitial extends AuthorizationState {}

class AuthorizationProcessingState extends AuthorizationState {}

class AuthorizationFinishedState extends AuthorizationState {
  const AuthorizationFinishedState(super.token);
}

class AuthorizationNeedUserPermissionState extends AuthorizationState {}

class AuthorizationErrorState extends AuthorizationState {}
