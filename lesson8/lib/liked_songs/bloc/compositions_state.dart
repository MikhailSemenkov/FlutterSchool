part of 'compositions_bloc.dart';

@immutable
abstract class CompositionsState {
  final List<Composition> compositions;

  const CompositionsState(this.compositions);
}

class CompositionsInitial extends CompositionsState {
  CompositionsInitial() : super([]);
}

class CompositionsLoadingState extends CompositionsState {
  CompositionsLoadingState() : super([]);
}

class CompositionsLoadedState extends CompositionsState {
  const CompositionsLoadedState(super.compositions);
}

class CompositionsErrorState extends CompositionsState {
  CompositionsErrorState() : super([]);
}
