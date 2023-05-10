import 'package:final_project/api_client/api_client.dart';
import 'package:final_project/authorization/repository/authorization_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(AuthorizationInitial()) {
    on<GetAuthorizationTokenEvent>(_onGetAuthorizationTokenEvent);
    on<GenerateAuthorizationTokenEvent>(_onGenerateAuthorizationTokenEvent);
  }

  _onGetAuthorizationTokenEvent(
      AuthorizationEvent event, Emitter<AuthorizationState> emit) async {
    emit(AuthorizationLoadingState());
    try {
      final token = await AuthorizationRepository.token;
      if (token == null) {
        emit(AuthorizationNeedUserActionState());
      } else {
        final testRequest = await APIClient().testRequest();
        if (testRequest == 200) {
          emit(AuthorizationFinishedState(token: token));
        } else {
          emit(AuthorizationNeedUserActionState());
        }
      }
    } catch (e) {
      emit(AuthorizationErrorState());
    }
  }

  _onGenerateAuthorizationTokenEvent(
      AuthorizationEvent event, Emitter<AuthorizationState> emit) async {
    emit(AuthorizationLoadingState());
    try {
      final token = await AuthorizationRepository.generateTokens(
          event.phoneNumber!, event.otp!);
      emit(AuthorizationFinishedState(token: token));
    } catch (e) {
      emit(AuthorizationErrorState());
    }
  }
}
