import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/playlist.dart';
import '../repository/library_repository.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final LibraryRepository repository;

  LibraryBloc({required this.repository}) : super(LibraryInitial()) {
    on<GetPlaylistsEvent>(_onGetPlaylists);
  }

  _onGetPlaylists(LibraryEvent event, Emitter<LibraryState> emit) async {
    emit(LibraryLoadingState());
    try {
      List<Playlist> playlists = await repository.getPlaylists();
      emit(LibraryLoadedState(playlists));
    } catch (e) {
      log(e.toString());
      emit(LibraryErrorState());
    }
  }
}
