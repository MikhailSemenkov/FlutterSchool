import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/composition.dart';
import '../repository/compositions_repository.dart';

part 'compositions_event.dart';
part 'compositions_state.dart';

class CompositionsBloc extends Bloc<CompositionsEvent, CompositionsState> {
  final CompositionsRepository repository;

  CompositionsBloc({required this.repository}) : super(CompositionsInitial()) {
    on<GetCompositionsEvent>(_onGetComposition);
  }

  _onGetComposition(
      CompositionsEvent event, Emitter<CompositionsState> emit) async {
    emit(CompositionsLoadingState());
    try {
      List<Composition> compositions = await repository.getCompositions();
      emit(CompositionsLoadedState(compositions));
    } catch (e) {
      log(e.toString());
      emit(CompositionsErrorState());
    }
  }
}
