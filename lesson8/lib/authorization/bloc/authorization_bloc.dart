import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/api_token.dart';
import '../repository/tokens_repository.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(AuthorizationInitial()) {
    on<GetAuthorizationEvent>(_onGetAuthorization);
    on<UserPermittedAuthorizationEvent>(_onUserPermittedAuthorization);
    on<RefreshAuthorizationEvent>(_onRefreshAuthorization);
  }

  _onGetAuthorization(
      AuthorizationEvent event, Emitter<AuthorizationState> emit) async {
    emit(AuthorizationProcessingState());
    log('processing');
    try {
      final token = await TokensRepository.tokens;
      if (token.accessToken == null) {
        emit(AuthorizationNeedUserPermissionState());
      } else {
        emit(AuthorizationFinishedState(token));
      }
    } catch (e) {
      log(e.toString());
      emit(AuthorizationErrorState());
    }
  }

  _onUserPermittedAuthorization(UserPermittedAuthorizationEvent event,
      Emitter<AuthorizationState> emit) async {
    log('permitted');
    emit(AuthorizationProcessingState());
    try {
      final token =
          await TokensRepository.generateTokens(event.authorizationRequest);
      emit(AuthorizationFinishedState(token));
    } catch (e) {
      emit(AuthorizationErrorState());
    }
  }

  _onRefreshAuthorization(
      AuthorizationEvent event, Emitter<AuthorizationState> emit) async {
    emit(AuthorizationProcessingState());
    try {} catch (e) {
      emit(AuthorizationErrorState());
    }
  }
}
