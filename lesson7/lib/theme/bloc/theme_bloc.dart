import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson7/theme/repository/theme_repository.dart';

import '../style/themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository repository;

  ThemeBloc({required this.repository}) : super(ThemeInitial(true)) {
    on<ChangeThemeEvent>(_onChangeTheme);
    on<LoadThemeEvent>(_onLoadTheme);
  }

  _onChangeTheme(ThemeEvent event, Emitter<ThemeState> emit) async {
    await repository.setTheme(!state.isDark);
    if (await repository.getTheme()) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  _onLoadTheme(ThemeEvent event, Emitter<ThemeState> emit) async {
    emit(LoadingThemeState());
    await Future.delayed(const Duration(seconds: 1));
    if (await repository.getTheme()) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }
}
