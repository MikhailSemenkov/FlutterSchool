part of 'library_bloc.dart';

@immutable
abstract class LibraryState {
  final List<Playlist> playlists;

  const LibraryState(this.playlists);
}

class LibraryInitial extends LibraryState {
  LibraryInitial() : super([]);
}

class LibraryLoadingState extends LibraryState {
  LibraryLoadingState() : super([]);
}

class LibraryLoadedState extends LibraryState {
  const LibraryLoadedState(super.playlists);
}

class LibraryErrorState extends LibraryState {
  LibraryErrorState() : super([]);
}
