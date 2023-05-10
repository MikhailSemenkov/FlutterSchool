part of 'authorization_bloc.dart';

abstract class AuthorizationState {
  String? token;

  AuthorizationState({this.token});
}

class AuthorizationInitial extends AuthorizationState {}

class AuthorizationLoadingState extends AuthorizationState {}

class AuthorizationFinishedState extends AuthorizationState {
  AuthorizationFinishedState({required super.token});
}

class AuthorizationErrorState extends AuthorizationState {}

class AuthorizationNeedUserActionState extends AuthorizationState {}
